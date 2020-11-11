(defpackage :lem-lsp-mode/lsp-mode
  (:use :cl :lem)
  (:import-from :lem-lsp-mode/json)
  (:import-from :lem-lsp-mode/utils)
  (:import-from :lem-lsp-mode/protocol)
  (:import-from :lem-lsp-mode/request)
  (:import-from :lem-lsp-mode/client))
(in-package :lem-lsp-mode/lsp-mode)

(cl-package-locks:lock-package :lem-lsp-mode/lsp-mode)
(lem-lsp-mode/project:local-nickname :protocol :lem-lsp-mode/protocol)
(lem-lsp-mode/project:local-nickname :utils :lem-lsp-mode/utils)
(lem-lsp-mode/project:local-nickname :request :lem-lsp-mode/request)
(lem-lsp-mode/project:local-nickname :json :lem-lsp-mode/json)
(lem-lsp-mode/project:local-nickname :client :lem-lsp-mode/client)

(defvar *workspaces* '())

(defstruct workspace
  root-uri
  client
  language-id
  server-capabilities
  server-info)

(defun find-workspace (root-uri language-id)
  (dolist (workspace *workspaces*)
    (when (and (equal (workspace-root-uri workspace)
                      root-uri)
               (equal (workspace-language-id workspace)
                      language-id))
      (return workspace))))

(defun buffer-workspace (buffer)
  (buffer-value buffer 'workspace))

(defun (setf buffer-workspace) (workspace buffer)
  (setf (buffer-value buffer 'workspace) workspace))

(defun buffer-language-spec (buffer)
  (get-language-spec (buffer-major-mode buffer)))

(defun buffer-language-id (buffer)
  (let ((spec (buffer-language-spec buffer)))
    (when spec
      (spec-langauge-id spec))))

(defun buffer-version (buffer)
  (buffer-modified-tick buffer))

(defun buffer-uri (buffer)
  (utils:pathname-to-uri (buffer-filename buffer)))

(lem:define-minor-mode lsp-mode
    (:name "Language Client"
     :enable-hook 'enable-hook))

(defun enable-hook ()
  (ensure-lsp-buffer (current-buffer)))

(defun find-root-pathname (directory uri-patterns)
  (or (utils:find-root-pathname directory
                                (lambda (file)
                                  (let ((file-name (file-namestring file)))
                                    (dolist (uri-pattern uri-patterns)
                                      (when (search uri-pattern file-name)
                                        (return t))))))
      (pathname directory)))

(defgeneric make-client (mode spec))

(defmethod make-client ((mode (eql :tcp)) spec)
  (make-instance 'client:tcp-client :port (spec-port spec)))

(defun buffer-change-event-to-content-change-event (point arg)
  (labels ((inserting-content-change-event (string)
             (let ((position (point-to-position point)))
               (json:make-json :range (make-instance 'protocol:range
                                                     :start position
                                                     :end position)
                               :range-length 0
                               :text string)))
           (deleting-content-change-event (count)
             (with-point ((end point))
               (character-offset end count)
               (json:make-json :range (make-instance 'protocol:range
                                                     :start (point-to-position point)
                                                     :end (point-to-position end))
                               :range-length (count-characters point end)
                               :text ""))))
    (etypecase arg
      (character
       (inserting-content-change-event (string arg)))
      (string
       (inserting-content-change-event arg))
      (integer
       (deleting-content-change-event arg)))))

(defun handle-change-buffer (point arg)
  (let ((buffer (point-buffer point))
        (change-event (buffer-change-event-to-content-change-event point arg)))
    (text-document/did-change buffer (json:json-array change-event))))

(defun make-and-connect-client (spec)
  (let ((client (make-client (spec-mode spec) spec)))
    (client:jsonrpc-connect client)
    client))

(defun ensure-lsp-buffer (buffer)
  (let* ((spec (buffer-language-spec buffer))
         (root-pathname (find-root-pathname (buffer-directory buffer)
                                            (spec-root-uri-patterns spec)))
         (root-uri (utils:pathname-to-uri root-pathname))
         (language-id (spec-langauge-id spec)))
    (let ((workspace (find-workspace root-uri language-id)))
      (cond ((null workspace)
             (let* ((client (make-and-connect-client spec))
                    (workspace (make-workspace :client client
                                               :root-uri root-uri
                                               :language-id language-id)))
               (push workspace *workspaces*)
               (setf (buffer-workspace buffer) workspace)
               ;; initialize, initializedが失敗したときに、無効なworkspaceが残ってしまう問題があるかもしれない
               (initialize workspace)
               (initialized workspace)))
            (t
             (setf (buffer-workspace buffer) workspace)))
      (text-document/did-open buffer)
      (lem:add-hook (lem:variable-value 'lem:before-change-functions :buffer buffer) 'handle-change-buffer))))

(defun initialize (workspace)
  (let ((initialize-result
          (request:lsp-call-method
           (workspace-client workspace)
           (make-instance
            'request:initialize-request
            :params (let ((x (make-instance
                              'protocol:initialize-params
                              :process-id (utils:get-pid)
                              :client-info (json:make-json :name "lem" #|:version "0.0.0"|#)
                              :root-uri (workspace-root-uri workspace)
                              :capabilities (make-instance
                                             'protocol:client-capabilities
                                             :workspace (json:make-json
                                                         :apply-edit nil
                                                         :workspace-edit nil
                                                         :did-change-configuration nil
                                                         :symbol nil
                                                         :execute-command nil)
                                             :text-document (make-instance
                                                             'protocol:text-document-client-capabilities
                                                             :hover (make-instance 'protocol:hover-client-capabilities)
                                                             :completion (make-instance 'protocol:completion-client-capabilities
                                                                                        :completion-item (json:make-json)
                                                                                        :context-support t))
                                             :experimental nil)
                              :trace nil
                              :workspace-folders nil)))
                      x)))))
    (setf (workspace-server-capabilities workspace)
          (protocol:initialize-result-capabilities initialize-result))
    (setf (workspace-server-info workspace)
          (protocol:initialize-result-server-info initialize-result)))
  (values))

(defun initialized (workspace)
  (request:lsp-call-method (workspace-client workspace)
                           (make-instance 'request:initialized-request)))

(defun point-to-position (point)
  (make-instance 'protocol:position
                 :line (1- (line-number-at-point point))
                 :character (point-charpos point)))

(defun buffer-to-text-document-item (buffer)
  (make-instance 'protocol:text-document-item
                 :uri (buffer-uri buffer)
                 :language-id (buffer-language-id buffer)
                 :version (buffer-version buffer)
                 :text (buffer-text buffer)))

(defun text-document/did-open (buffer)
  (request:lsp-call-method
   (workspace-client (buffer-workspace buffer))
   (make-instance 'request:text-document-did-open
                  :params (make-instance 'protocol:did-open-text-document-params
                                         :text-document (buffer-to-text-document-item buffer)))))

(defun text-document/did-change (buffer content-changes)
  (request:lsp-call-method
   (workspace-client (buffer-workspace buffer))
   (make-instance 'request:text-document-did-change
                  :params (make-instance 'protocol:did-change-text-document-params
                                         :text-document (make-instance 'protocol:versioned-text-document-identifier
                                                                       :version (buffer-version buffer)
                                                                       :uri (buffer-uri buffer))
                                         :content-changes content-changes))))

;;; hover

;; TODO
;; - workDoneProgress
;; - partialResult
;; - hoverClientCapabilitiesのcontentFormatを設定する
;; - hoverのrangeを使って範囲に背景色をつける
;; - markdownの中のコード表示時に対象の言語のシンタックスハイライトをする

(defun hover-to-string (hover)
  (flet ((marked-string-to-string (marked-string)
           (if (stringp marked-string)
               marked-string
               (or (json:json-get marked-string "value")
                   ""))))
    (let ((contents (protocol:hover-contents hover)))
      (cond
        ;; MarkedString
        ((json:json-object-p contents)
         (marked-string-to-string contents))
        ;; MarkedString[]
        ((json:json-array-p contents)
         (with-output-to-string (out)
           (dolist (content contents)
             (write-string (marked-string-to-string content)
                           out))))
        ;; MarkupContent
        ((typep contents 'protocol:markup-content)
         (protocol:markup-content-value contents))
        (t
         "")))))

(defun make-text-document-position-arguments (point)
  (list
   :text-document (make-instance
                   'protocol:text-document-identifier
                   :uri (buffer-uri (point-buffer point)))
   :position (point-to-position point)))

(defun text-document/hover (point)
  (let ((result
          (request:lsp-call-method
           (workspace-client (buffer-workspace (point-buffer point)))
           (make-instance 'request:hover-request
                          :params (apply #'make-instance
                                         'protocol:hover-params
                                         (make-text-document-position-arguments point))))))
    (when (typep result 'protocol:hover)
      (message "~A" (hover-to-string result)))))

(define-command lsp-hover () ()
  (text-document/hover (current-point)))

;;; completion

;; TODO
;; - workDoneProgress
;; - partialResult
;; - completionParams.context, どのように補完が起動されたかの情報を含める

(defun text-document/completion (point)
  (request:lsp-call-method
   (workspace-client (buffer-workspace (point-buffer point)))
   (make-instance 'request:completion-request
                  :params (apply #'make-instance
                                 'protocol:completion-params
                                 (make-text-document-position-arguments point)))))

;;;
(defvar *language-spec-table* (make-hash-table))

(defun get-language-spec (major-mode)
  (gethash major-mode *language-spec-table*))

(defun spec-langauge-id (spec)
  (getf spec :language-id))

(defun spec-root-uri-patterns (spec)
  (getf spec :root-uri-patterns))

(defun spec-mode (spec)
  (getf spec :mode))

(defun spec-port (spec)
  (getf spec :port))

(defmacro def-language-spec (major-mode &rest plist)
  `(setf (gethash ',major-mode *language-spec-table*)
         (list ,@plist)))

(def-language-spec lem-go-mode:go-mode
  :language-id "go"
  :root-uri-patterns '("go.mod")
  :mode :tcp
  :port 12345)

#|
ファイルを開く
そのファイルがどの言語のファイルかを判別し、それをlanguage-idとする
そのファイルのルートディレクトリをlanguage-idを元に探す
ルートディレクトリに対応するworkspaceが既に作られていないか確認する
あればそのファイルとworkspaceを紐付ける
なければ新しくworkspaceを作る

workspaceは以下のような要素を含んだ構造
- 一つ以上のルートディレクトリ
- language-id
- サーバとのコネクション
- etc

workspaceを作るとき、新しくサーバプログラムを起動してstdioかtcpで接続する(tcpの場合は既に立ち上がってるサーバに接続したい場合もある?)
そのときクライアントはサーバに対してinitializeリクエストを行う
返ってきたレスポンスinitialized-resultにserverの情報が入っているので、それをワーススペースに保存する
|#
