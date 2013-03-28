(require 'package)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/")t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/")t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby starter-kit-js)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
        (package-install p)))

; http://ergoemacs.org/emacs/elisp_perl_wrapper.html
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
(push "/Users/bspage/bin" exec-path)

(column-number-mode t)

; Givex emacs access to git
(push "/usr/local/git/bin" exec-path)

;; Interactively Do Things
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/elpa/rinari-2.9")
(require 'rinari)

;; Update ctags
(setq rinari-tags-file-name "~/keystone/TAGS")

;; comment-dwim
(global-set-key "\C-c\C-c" 'comment-dwim)

;; indent-region
(global-set-key "\C-c\C-i" 'indent-region)

;; turn on line numbers for ruby
(add-hook 'ruby-mode-hook
            (lambda () (linum-mode 1)))

;; turn off line wrapping
(setq default-truncate-lines t)

;; keyboard scroll one line at a time
(setq scroll-step 1)

; Display the time in the Emacs status area
(setq display-time-day-and-date t)
(display-time)

; spaces for tabs
(setq-default indent-tabs-mode nil)

; 2 space tab
(setq-default tab-width 2) 

; remap for backward-kill-word
;; (global-set-key "\C-w" 'backward-kill-word)
;; (global-set-key "\C-x\C-k" 'kill-region)
;; (global-set-key "\C-c\C-k" 'kill-region)

; turn off scroll/tool/menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; Load theme.
(load-theme 'whiteboard t)

; next window
(global-set-key "\C-xn" 'other-window)

; previous window
(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key "\C-xp" 'other-window-backward)

; scrolling
;; (defalias 'scroll-ahead 'scroll-up)
;; (defalias 'scroll-behind 'scroll-down)

;; (defun scroll-n-lines-ahead (&optional n)
;;   "Scroll ahead N lines (1 by default)."
;;   (interactive "P")
;;   (scroll-ahead (prefix-numeric-value n)))

;; (defun scroll-n-lines-behind (&optional n)
;;   "Scroll behind N lines (1 by default)."
;;   (interactive "P")
;;   (scroll-behind (prefix-numeric-value n)))

;; (global-set-key "\C-q" 'scroll-n-lines-behind)
;; (global-set-key "\C-z" 'scroll-n-lines-ahead)

; These are new in Emacs 24.1
(global-set-key "\C-q" 'scroll-up-line)
(global-set-key "\C-z" 'scroll-down-line)

; move point to top of window
(defun point-to-top ()
  "Put point on top line of window."
  (interactive)
  (move-to-window-line 0))
(global-set-key "\M-," 'point-to-top)
(global-set-key "\C-x," 'tags-loop-continue)

; move point to bottom of window
(defun point-to-bottom ()
  "Put point at beginning of last visible line."
  (interactive)
  (move-to-window-line -1))
(global-set-key "\M-." 'point-to-bottom)
(global-set-key "\C-x." 'tags-loop-continue)

(defun line-to-top ()
  "Move current line to top of window."
  (interactive)
  (recenter 0))
(global-set-key "\M-!" 'line-to-top)

; jira mode
;(require 'jira)

; twitter mode
(require 'twittering-mode)

; iedit
(require 'iedit)

; port of GitGutter which is a plugin of Sublime Text
(require 'git-gutter)                   ;

; toggle fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(global-set-key "\C-ct" 'toggle-fullscreen)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(jira-url "https://staff.webassign.net/jira/rpc/xmlrpc"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
