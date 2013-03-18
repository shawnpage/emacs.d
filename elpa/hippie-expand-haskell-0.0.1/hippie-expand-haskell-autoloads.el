;;; hippie-expand-haskell-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (set-up-haskell-hippie-expand try-expand-haskell)
;;;;;;  "hippie-expand-haskell" "hippie-expand-haskell.el" (20782
;;;;;;  5458))
;;; Generated autoloads from hippie-expand-haskell.el

(autoload 'try-expand-haskell "hippie-expand-haskell" "\
Try function for `hippie-expand' using ghc's completion function.

\(fn OLD)" nil nil)

(autoload 'set-up-haskell-hippie-expand "hippie-expand-haskell" "\
Use `ghc-select-completion-symbol' as a hippie expand try function.
Will add `try-expand-haskell' to the front of `hippie-expand-try-functions-list'

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("hippie-expand-haskell-pkg.el") (20782
;;;;;;  5458 911005))

;;;***

(provide 'hippie-expand-haskell-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; hippie-expand-haskell-autoloads.el ends here
