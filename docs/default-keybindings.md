## Move
| Command                                                                                                       | Key bindings  | Documentation                                         |
|---------------------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------|
| [next-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L62)                          | C-n, Down     | Move the cursor to next line.                         |
| [next-logical-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L69)                  |               | Move the cursor to the next logical line.             |
| [previous-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L76)                      | C-p, Up       | Move the cursor to the previous line.                 |
| [previous-logical-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L80)              |               | Move the cursor to the previous logical line.         |
| [forward-char](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L84)                       | C-f, Right    | Move the cursor to the next character.                |
| [backward-char](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L90)                      | C-b, Left     | Move the cursor to the previous character.            |
| [move-to-beginning-of-buffer](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L95)        | M-<           | Move the cursor to the beginning of the buffer.       |
| [move-to-end-of-buffer](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L100)             | M->           | Move the cursor to the end of the buffer.             |
| [move-to-beginning-of-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L105)         | C-a, Home     | Move the cursor to the beginning of the line.         |
| [move-to-beginning-of-logical-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L121) |               | Move the cursor to the beginning of the logical line. |
| [move-to-end-of-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L125)               | C-e, End      | Move the cursor to the end of the line.               |
| [move-to-end-of-logical-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L131)       |               | Move the cursor to the end of the logical line.       |
| [next-page](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L135)                         | C-v, PageDown | Move the cursor to the next page by one page.         |
| [previous-page](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L143)                     | M-v, PageUp   | Move the cursor to the previous page by one page.     |
| [next-page-char](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L151)                    | C-x ]         | Move the cursor to the next page character (^L).      |
| [previous-page-char](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L161)                | C-x [         | Move the cursor to the previous page character (^L).  |
| [goto-line](https://github.com/lem-project/lem/blob/main/src/commands/move.lisp#L165)                         | M-g           | Move the cursor to the specified line number.         |

## Edit
| Command                                                                                                | Key bindings      | Documentation                                                                        |
|--------------------------------------------------------------------------------------------------------|-------------------|--------------------------------------------------------------------------------------|
| [self-insert](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L72)                 |                   | Insert the input character.                                                          |
| [newline](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L85)                     | Return            | Insert a new line.                                                                   |
| [open-line](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L89)                   | C-o               | Insert a new line without moving the cursor position.                                |
| [quoted-insert](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L93)               | C-q               | Insert the next entered key (including control characters).                          |
| [delete-next-char](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L108)           | C-d, Delete       | Delete the next character.                                                           |
| [delete-previous-char](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L131)       | C-h, Backspace    | Delete the previous character.                                                       |
| [copy-region](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L145)                | M-w               | Copy the text of region.                                                             |
| [copy-region-to-clipboard](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L151)   |                   | Copy the selected text to the clipboard.                                             |
| [kill-region](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L163)                | C-w               | Kill the text of region.                                                             |
| [kill-region-to-clipboard](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L172)   |                   | Kill the text of region and copy to the clipboard.                                   |
| [kill-line](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L177)                  | C-k               | Kill from the current cursor position to the end of the line.                        |
| [kill-whole-line](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L196)            | C-Shift-Backspace | Kill the entire line and the remaining whitespace                                    |
| [yank](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L215)                       | C-y               | Paste the copied text.                                                               |
| [yank-pop](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L219)                   | M-y               | Replaces the immediately pasted text with the next text in the killring.             |
| [yank-pop-next](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L232)              |                   | Replaces the immediately preceding yank-pop text with the text before the kill ring. |
| [yank-to-clipboard](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L245)          |                   | Copy the text of the killring to the clipboard.                                      |
| [paste-from-clipboard](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L252)       |                   | Inserts text from the clipboard.                                                     |
| [entab-line](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L270)                 |                   | Replaces the indent of the current line from space to tab.                           |
| [detab-line](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L276)                 |                   | Replaces the indent of the current line from tab to space.                           |
| [delete-blank-lines](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L283)         | C-x C-o           | Delete blank lines before and after the cursor.                                      |
| [just-one-space](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L307)             | M-Space           | Combines consecutive whitespace before and after the cursor into one.                |
| [delete-indentation](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L313)         | M-^               | Merge the current line with the previous line.                                       |
| [transpose-characters](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L333)       | C-t               | Swaps the characters before and after the cursor.                                    |
| [undo](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L350)                       | C-\               | Undo.                                                                                |
| [redo](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L357)                       | C-_, C-/          | Redo.                                                                                |
| [delete-trailing-whitespace](https://github.com/lem-project/lem/blob/main/src/commands/edit.lisp#L384) |                   | Removes all end-of-line and end-of-buffer whitespace from the current buffer.        |

## Mark
| Command                                                                                          | Key bindings | Documentation                                                  |
|--------------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------|
| [mark-set](https://github.com/lem-project/lem/blob/main/src/commands/mark.lisp#L13)              | C-@, C-Space | Sets a mark at the current cursor position.                    |
| [exchange-point-mark](https://github.com/lem-project/lem/blob/main/src/commands/mark.lisp#L19)   | C-x C-x      | Exchange the current cursor position with the marked position. |
| [mark-set-whole-buffer](https://github.com/lem-project/lem/blob/main/src/commands/mark.lisp#L27) | C-x h        | Select the whole buffer as a region.                           |

## Word
| Command                                                                                          | Key bindings                    | Documentation                                             |
|--------------------------------------------------------------------------------------------------|---------------------------------|-----------------------------------------------------------|
| [forward-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L82)          | M-f, C-Right                    | Move to cursor to next word.                              |
| [previous-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L86)         | M-b, C-Left                     | Move to cursor to previous word                           |
| [delete-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L90)           | M-d, C-Delete                   | Delete the next word.                                     |
| [backward-delete-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L104) | M-C-h, M-Backspace, C-Backspace | Delete the previous word.                                 |
| [downcase-region](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L135)      | C-x C-l                         | Replaces the selected region with a downcase.             |
| [uppercase-region](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L139)     | C-x C-u                         | Replaces the selected region with a uppercase.            |
| [capitalize-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L160)      | M-c                             | Replace the following word with capital-case.             |
| [lowercase-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L164)       | M-l                             | Replace the following word with lowercase.                |
| [uppercase-word](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L168)       | M-u                             | Replace the following word with uppercase.                |
| [forward-paragraph](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L172)    | M-}                             | Move cursor to forward paragraph.                         |
| [backward-paragraph](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L185)   | M-{                             | Move cursor to backward paragraph.                        |
| [kill-paragraph](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L189)       | M-k                             | Kill the forward paragraph.                               |
| [count-words](https://github.com/lem-project/lem/blob/main/src/commands/word.lisp#L205)          | M-=                             | Count the number of lines/words/characters in the buffer. |

## S-Expression
| Command                                                                                             | Key bindings     | Documentation                                     |
|-----------------------------------------------------------------------------------------------------|------------------|---------------------------------------------------|
| [forward-sexp](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L28)     | M-C-f            | Move the cursor to the forward expression.        |
| [backward-sexp](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L39)    | M-C-b            | Move the cursor to the backward expression.       |
| [forward-list](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L43)     | M-C-n            | Move the cursor to the forward list.              |
| [backward-list](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L47)    | M-C-p            | Move the cursor to the backward list.             |
| [down-list](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L51)        | M-C-d            | Move the cursor to the inner expression.          |
| [backward-up-list](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L55) | M-C-u            | Move the cursor to the outer expression.          |
| [mark-sexp](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L60)        | M-C-@, M-C-Space | Select the forward expression as a region.        |
| [kill-sexp](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L70)        | M-C-k            | Kill the forward expression as a region.          |
| [transpose-sexps](https://github.com/lem-project/lem/blob/main/src/commands/s-expression.lisp#L79)  | M-C-t            | Swaps the expression before and after the cursor. |

## File
| Command                                                                                           | Key bindings | Documentation                                                                                                 |
|---------------------------------------------------------------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------|
| [find-file](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L64)              | C-x C-f      | Open the file.                                                                                                |
| [find-file-recursively](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L206) |              | Open a file, from the list of all files present under the buffer's direcotry, recursively.                    |
| [read-file](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L222)             | C-x C-r      | Open the file as a read-only.                                                                                 |
| [save-current-buffer](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L260)   | C-x C-s      | Saves the current buffer text to a file                                                                       |
| [write-file](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L266)            | C-x C-w      | Saves the text in the current buffer to the specified file                                                    |
| [write-region-file](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L287)     |              | Saves the region of text to the specified file                                                                |
| [insert-file](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L295)           | C-x Tab      | Inserts the contents of the file into the current buffer.                                                     |
| [save-some-buffers](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L301)     | C-x s        | Save some files in the open buffer.                                                                           |
| [revert-buffer](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L333)         |              | Restores the buffer. Normally this command will cause the contents of the file to be reflected in the buffer. |
| [change-directory](https://github.com/lem-project/lem/blob/main/src/commands/file.lisp#L366)      |              | Change directories associated with the buffer.                                                                |

## Buffer
| Command                                                                                       | Key bindings | Documentation                                 |
|-----------------------------------------------------------------------------------------------|--------------|-----------------------------------------------|
| [toggle-read-only](https://github.com/lem-project/lem/blob/main/src/commands/buffer.lisp#L14) | C-x C-q      | Toggle the buffer read-only.                  |
| [rename-buffer](https://github.com/lem-project/lem/blob/main/src/commands/buffer.lisp#L22)    |              | Rename the buffer.                            |
| [unmark-buffer](https://github.com/lem-project/lem/blob/main/src/commands/buffer.lisp#L26)    | M-~          | Remove the mark where the buffer was changed. |

## Window
| Command                                                                                                        | Key bindings   | Documentation                                                         |
|----------------------------------------------------------------------------------------------------------------|----------------|-----------------------------------------------------------------------|
| [select-buffer](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L62)                     | C-x b          | Switches to the selected buffer.                                      |
| [kill-buffer](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L101)                      | C-x k          | Delete buffer.                                                        |
| [previous-buffer](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L110)                  | C-x Left       | Switches to the previous buffer.                                      |
| [next-buffer](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L120)                      | C-x Right      | Switches to the next buffer.                                          |
| [recenter](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L126)                         | C-l            | Scroll so that the cursor is in the middle.                           |
| [split-active-window-vertically](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L133)   | C-x 2          | Split the current window vertically.                                  |
| [split-active-window-horizontally](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L139) | C-x 3          | Split the current window horizontally.                                |
| [other-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L150)                     | C-x o, M-o     | Go to the next window.                                                |
| [switch-to-last-focused-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L163)    |                | Go to the window that was last in focus.                              |
| [window-move-down](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L172)                 |                | Go to the window on the down.                                         |
| [window-move-up](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L177)                   |                | Go to the window on the up.                                           |
| [window-move-right](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L182)                |                | Go to the window on the right.                                        |
| [window-move-left](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L187)                 |                | Go to the window on the left.                                         |
| [delete-other-windows](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L192)             | C-x 1          | Delete all other windows.                                             |
| [delete-active-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L205)             | C-x 0          | Delete the active window.                                             |
| [quit-active-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L210)               |                | Quit the active window. This is a command for a popped-up window.     |
| [grow-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L215)                      | C-x ^          | Grow the window's height.                                             |
| [shrink-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L223)                    | C-x C-z        | Shrink the window's height.                                           |
| [grow-window-horizontally](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L231)         | C-x }          | Grow the window's width.                                              |
| [shrink-window-horizontally](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L239)       | C-x {          | Shrink the window's width.                                            |
| [scroll-down](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L252)                      | C-Down, M-Down | Scroll down.                                                          |
| [scroll-up](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L265)                        | C-Up, M-Up     | Scroll up.                                                            |
| [find-file-other-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L276)           | C-x 4 f        | Open a file in another window. Split the screen vertically if needed. |
| [read-file-other-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L277)           | C-x 4 r        | Read a file in another window.                                        |
| [select-buffer-other-window](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L278)       | C-x 4 b        | Select a buffer in another window.                                    |
| [compare-windows](https://github.com/lem-project/lem/blob/main/src/commands/window.lisp#L280)                  |                |                                                                       |

## Multiple-Cursors
| Command                                                                                                        | Key bindings | Documentation                                               |
|----------------------------------------------------------------------------------------------------------------|--------------|-------------------------------------------------------------|
| [add-cursors-to-next-line](https://github.com/lem-project/lem/blob/main/src/commands/multiple-cursors.lisp#L8) | M-C          | Duplicates the cursor under the currently existing cursors. |

## Process
| Command                                                                                     | Key bindings | Documentation                                                                         |
|---------------------------------------------------------------------------------------------|--------------|---------------------------------------------------------------------------------------|
| [filter-buffer](https://github.com/lem-project/lem/blob/main/src/commands/process.lisp#L10) | C-x #        | Replaces the contents of the buffer with the result of executing the command entered. |
| [pipe-command](https://github.com/lem-project/lem/blob/main/src/commands/process.lisp#L43)  | C-x @        | Run a command and displays the output.                                                |

## Help
| Command                                                                                      | Key bindings | Documentation                                                                |
|----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------|
| [describe-key](https://github.com/lem-project/lem/blob/main/src/commands/help.lisp#L12)      | C-x ?        | Tell what is the command associated to a keybinding.                         |
| [describe-bindings](https://github.com/lem-project/lem/blob/main/src/commands/help.lisp#L41) |              | Describe the bindings of the buffer's current major mode.                    |
| [list-modes](https://github.com/lem-project/lem/blob/main/src/commands/help.lisp#L63)        |              | Output all available major and minor modes.                                  |
| [apropos-command](https://github.com/lem-project/lem/blob/main/src/commands/help.lisp#L100)  |              | Find all symbols in the running Lisp image whose names match a given string. |
| [lem-version](https://github.com/lem-project/lem/blob/main/src/commands/help.lisp#L107)      |              | Display Lem's version.                                                       |

## Font
| Command                                                                                       | Key bindings | Documentation                                                        |
|-----------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------|
| [font-size-increase](https://github.com/lem-project/lem/blob/main/src/commands/font.lisp#L10) | C-+          | Make the font larger (this currently only works with SDL2 frontend)  |
| [font-size-decrease](https://github.com/lem-project/lem/blob/main/src/commands/font.lisp#L14) | C--          | Make the font smaller (this currently only works with SDL2 frontend) |

## Other
| Command                                                                                       | Key bindings   | Documentation                                                |
|-----------------------------------------------------------------------------------------------|----------------|--------------------------------------------------------------|
| [nop-command](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L22)       | NopKey         |                                                              |
| [undefined-key](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L25)     |                | Signal undefined key error.                                  |
| [keyboard-quit](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L29)     | C-g            | Signal a `quit` condition.                                   |
| [escape](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L33)            | Escape         | Signal a `quit` condition silently.                          |
| [exit-lem](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L37)          | C-x C-c        | Ask for modified buffers before exiting lem.                 |
| [quick-exit](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L44)        |                | Exit the lem job and kill it.                                |
| [execute-command](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L49)   | M-x            | Read a command name, then read the ARG and call the command. |
| [show-context-menu](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L68) | Shift-F10, M-h |                                                              |
| [load-library](https://github.com/lem-project/lem/blob/main/src/commands/other.lisp#L74)      |                | Load the Lisp library named NAME.                            |

