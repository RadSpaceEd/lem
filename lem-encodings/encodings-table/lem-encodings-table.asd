;;don't edit
(defsystem "lem-encodings-table"
  :depends-on (:ICONV)
  :class :package-inferred-system
  :components ((:FILE "8bit") (:FILE "euc") (:FILE "sjis") (:FILE "main")))
