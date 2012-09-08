(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby starter-kit-js)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))

(defun print-perl-debug (startPos endPos)
    "Do some text processing on region.
This command calls the external ."
    (interactive "r")
      (let (scriptName)
            (setq scriptName "print_perl_debug") ; full path to your script
                (shell-command-on-region startPos endPos scriptName nil t nil t)
                    ))

(global-set-key "\C-cd" 'print-perl-debug)

(push "/usr/local/bin" exec-path)

; give emacs access to git
(push "/usr/local/git/bin" exec-path)

