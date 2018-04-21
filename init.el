; spaces for tabs
(setq-default indent-tabs-mode nil)

; 4 space tab
(setq-default tab-width 4) 

; turn off scroll/tool/menu bar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; set the font size to 15
;(set-face-attribute 'default nil :height 150)

; set the font size to 13
;(set-face-attribute 'default nil :height 130)

; set the font size to 12
(set-face-attribute 'default nil :height 120)

; set the font size to 11
;(set-face-attribute 'default nil :height 110)

; set the font size to 10
;(set-face-attribute 'default nil :height 100)

; turn off splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(require 'package)

;; (add-to-list 'package-archives
;;              '("gnu" . "http://elpa.gnu.org/packages/")t)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/")t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/")t)

(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; cider clojure repl
(setq nrepl-log-messages t)

;(when (not package-archive-contents)
;   (package-refresh-contents))

;; Add in your own as you wish:
;; (defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby starter-kit-js)
;; (defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings)
;;   "A list of packages to ensure are installed at launch.")

;; (dolist (p my-packages)
;;   (when (not (package-installed-p p))
;;         (package-install p)))

;; fix the PATH variable
;; from http://clojure-doc.org/articles/tutorials/emacs.html
;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))


;; (setenv "PATH" (concat (getenv "PATH") ":/Users/shawnpage/bin" "/usr/bin" "/bin"))

(push "/bin" exec-path)
;; (push "/usr/bin" exec-path)
;; (push "/usr/local/bin" exec-path)
;; (push "/Users/bspage/bin" exec-path)
(push "/Users/shawnpage/bin" exec-path)

;; ; set PATH for eshell
;; (setenv "PATH"
;;   (concat
;;    "/bin" ";"
;;    "/usr/bin" ";"
;;    "/usr/local/bin" ";"
;;    "/Users/bspage/bin" ";"
;;    "/Users/shawnpage/bin" ";"
;;    "/usr/local/go/bin" ";"
;;    (getenv "PATH") ; inherited from OS
;;   )
;; )

; These broke stuff
;;(addpath "/usr/local/go/bin")
;;(push "/usr/local/go/bin" eshell-path-env)
;;(setq eshell-path-env (concat "/usr/local/go/bin" ":" eshell-path-env))

; http://ergoemacs.org/emacs/elisp_perl_wrapper.html
;; (defun print-perl-debug (startPos endPos)
;;     "Do some text processing on region.
;; This command calls the external ."
;;     (interactive "r")
;;       (let (scriptName)
;;             (setq scriptName "print_perl_debug") ; full path to your script
;;                 (shell-command-on-region startPos endPos scriptName nil t nil t)
;;                     ))

;; (global-set-key "\C-cd" 'print-perl-debug)

;; (defun print-coffee-debug (startPos endPos)
;;     "Do some text processing on region.
;; This command calls the external ."
;;     (interactive "r")
;;       (let (scriptName)
;;             (setq scriptName "/Users/bspage/bin/print_coffee_debug") ; full path to your script
;;                 (shell-command-on-region startPos endPos scriptName nil t nil t)
;;                     ))

;; (global-set-key "\C-cd" 'print-coffee-debug)

(defun print-js-debug (startPos endPos)
    "Do some text processing on region.
This command calls the external ."
    (interactive "r")
      (let (scriptName)
            (setq scriptName "/Users/bspage/bin/print_js_debug") ; full path to your script
                (shell-command-on-region startPos endPos scriptName nil t nil t)
                    ))

(global-set-key "\C-cd" 'print-js-debug)

(column-number-mode t)

; Givex emacs access to git
(push "/usr/local/git/bin" exec-path)

;; Interactively Do Things
(require 'ido)
(ido-mode t)

;; Rinari
;; (add-to-list 'load-path "~/.emacs.d/elpa/rinari-2.9")
;; (require 'rinari)

;; Update ctags
;; (setq rinari-tags-file-name "~/keystone/TAGS")

;; turn on line numbers for ruby
(add-hook 'ruby-mode-hook
          (lambda () (linum-mode 1)))

;; turn off line wrapping
;(setq default-truncate-lines t)

;; keyboard scroll one line at a time
(setq scroll-step 1)

; Display the time in the Emacs status area
(setq display-time-day-and-date t)
(display-time)

; remap for backward-kill-word
;; (global-set-key "\C-w" 'backward-kill-word)
;; (global-set-key "\C-x\C-k" 'kill-region)
;; (global-set-key "\C-c\C-k" 'kill-region)

; Load theme.
;(load-theme 'distinguished t)
;(load-theme 'gandalf t)
;(load-theme 'solarized t)
;(load-theme 'zenburn t)
;(load-theme 'ample t)
;(load-theme 'soft-morning t)
;(load-theme 'soft-charcoal t)
;(load-theme 'graham t)
;(load-theme 'fogus t)
;(load-theme 'hc-zenburn t)
(load-theme 'nyx t)

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
;(require 'git-gutter)                   ;

; toggle fullscreen
(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(global-set-key "\C-ct" 'toggle-fullscreen)

; delete selection on insert
(delete-selection-mode +1)

(setq electric-indent-mode t)

;; make some use of the Super key
(define-key global-map [?\s-d] 'projectile-find-dir)
(define-key global-map [?\s-e] 'er/expand-region)
(define-key global-map [?\s-f] 'projectile-find-file)
(define-key global-map [?\s-g] 'projectile-grep)
(define-key global-map [?\s-j] 'prelude-top-join-line)
(define-key global-map [?\s-k] 'prelude-kill-whole-line)
(define-key global-map [?\s-l] 'goto-line)
(define-key global-map [?\s-m] 'magit-status)
(define-key global-map [?\s-o] 'prelude-open-line-above)
(define-key global-map [?\s-w] 'delete-frame)
(define-key global-map [?\s-x] 'exchange-point-and-mark)
(define-key global-map [?\s-p] 'projectile-switch-project)

;;;;;;;;;;;;;;;;;;;;;;
; JS Setup

(require 'js2-mode)
(require 'js-comint) 

;; js2-mode auto for .js files
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;(setq inferior-js-program-command "node") ;; not "node-repl"
(setq inferior-js-program-command "node --interactive")

(setenv "NODE_NO_READLINE" "1")

;; Use your favorited js mode here:
(add-hook 'js2-mode-hook (lambda () 
    (local-set-key "\C-x\C-e" 'js-send-last-sexp)
    (local-set-key "\C-\M-x"  'js-send-last-sexp-and-go)
    (local-set-key "\C-cb"    'js-send-buffer)
    (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)))


; js lintnode with flymake
; http://blog.deadpansincerity.com/2011/05/setting-up-emacs-as-a-javascript-editing-environment-for-fun-and-profit/
;; (add-to-list 'load-path "~/src/lintnode")
;; (require 'flymake-jslint)

;; Make sure we can find the lintnode executable
;;(setq lintnode-location "~/src/lintnode")
;; JSLint can be... opinionated
;;(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we first open a js file and start checking
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (lintnode-hook)))

; Need a js repl
; http://www.emacswiki.org/emacs/NodeJs
; The cli was ouputting garbage to term

; Got a js repl
; http://www.idryman.org/blog/2013/03/23/installing-swank-dot-js/
;; (add-to-list 'load-path "~/.emacs.d/slime")



(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-lisp-implementations
           '((sbcl ("sbcl" "--core" "sbcl.core-for-slime"))))

(require 'slime)
(slime-setup)

;; ;; swank-js settings
;; (global-set-key [f5] 'slime-js-reload)
;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (slime-js-minor-mode 1)))

;; (load-file "~/.emacs.d/setup-slime-js.el")

;; turn on line numbers
(global-set-key "\C-cl" 'linum-mode)

;; comment-dwim
(global-set-key "\C-c\C-c" 'comment-dwim)

;; indent-region
(global-set-key "\C-c\C-i" 'indent-region)

;; turn on yank/paste in multi-term
(add-hook 'term-mode-hook
    (lambda ()
      (define-key term-raw-map (kbd "C-y") 'term-paste)))

;; coffeescript
;; (defun coffee-custom ()
;;   "coffee-mode-hook"
;;  (set (make-local-variable 'tab-width) 2))

;; (add-hook 'coffee-mode-hook
;;   '(lambda() (coffee-custom)))


; verticalness
;; indent guide
(require 'indent-guide)
(indent-guide-global-mode)
;; cursor guide
(require 'vline)

; helm
;(helm-mode 1)

; auto-complete
;(require 'auto-complete-config)
;(ac-config-default)

; ac-helm
;(ac-complete-with-helm)

; pair mode
(show-paren-mode)
(electric-pair-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "3eb2b5607b41ad8a6da75fe04d5f92a46d1b9a95a202e3f5369e2cdefb7aac5c" "0b6cb9b19138f9a859ad1b7f753958d8a36a464c6d10550119b2838cedf92171" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "718fb4e505b6134cc0eafb7dad709be5ec1ba7a7e8102617d87d3109f56d9615" "f1a3fbf77d781c1cd10d4d8f6ba1eced7318a731b6d4faeb59a271045e496e12" "d79ece4768dfc4bab488475b85c2a8748dcdc3690e11a922f6be5e526a20b485" "60b6fc371e0791ee004f36f2e70408d3fa3af1c4d1e16a47f3305ce4b95e4fa8" "1b1e54d9e0b607010937d697556cd5ea66ec9c01e555bb7acea776471da59055" "a4c9e536d86666d4494ef7f43c84807162d9bd29b0dfd39bdf2c3d845dcc7b2e" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "2e1e2657303116350fe764484e8300ca2e4cf45a73cdbd879bc0ca29cb337147" "6ee6f99dc6219b65f67e04149c79ea316ca4bcd769a9e904030d38908fd7ccf9" "47744f6c8133824bdd104acc4280dbed4b34b85faa05ac2600f716b0226fb3f6" "0e33022384e4db1374827f51e3d9e9a2d56282c2e3568c22f1c12ad80e20cf0c" "9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" "551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "353861e69d6510a824905208f7290f90248f0b9354ee034fd4562b962790bdfc" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "12ae26f3493216be1bc0bbd28732671e8672bc3c631f1cea042a1040b136058a" "67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "1a5c1be3b14ee44e9cd926c4fe23055bc74bbc9725b01ebee78a1d1cb2b266f4" "afc220610bee26945b7c750b0cca03775a8b73c27fdca81a586a0a62d45bbce2" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "14225e826195202fbc17dcf333b94d91deb6e6f5ca3f5a75357009754666822a" "573e46dadf8c2623256a164831cfe9e42d5c700baed1f8ecd1de0675072e23c2" "42089e9dfe41a491e48b05c31b6f1851abf4e5a704951bb55cd0e44186937cbb" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "a444b2e10bedc64e4c7f312a737271f9a2f2542c67caa13b04d525196562bf38" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "6a9606327ecca6e772fba6ef46137d129e6d1888dcfc65d0b9b27a7a00a4af20" "2d7e4feac4eeef3f0610bf6b155f613f372b056a2caae30a361947eab5074716" "2b56bd7a702f4dd5f50db417ec2bcdd06a878a0e2834e9ab37ad3c5c93aaab74" "024b0033a950d6a40bbbf2b1604075e6c457d40de0b52debe3ae994f88c09a4a" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "7d4d00a2c2a4bba551fcab9bfd9186abe5bfa986080947c2b99ef0b4081cb2a6" "865d6cb994f89c13b2d7e5961df4eabeea12494583c240c8fe9a788d0f4ee12c" "dc46381844ec8fcf9607a319aa6b442244d8c7a734a2625dac6a1f63e34bc4a6" "33c5a452a4095f7e4f6746b66f322ef6da0e770b76c0ed98a438e76c497040bb" "29a4267a4ae1e8b06934fec2ee49472daebd45e1ee6a10d8ff747853f9a3e622" "4a60f0178f5cfd5eafe73e0fc2699a03da90ddb79ac6dbc73042a591ae216f03" "769bb56fb9fd7e73459dcdbbfbae1f13e734cdde3cf82f06a067439568cdaa95" "2affb26fb9a1b9325f05f4233d08ccbba7ec6e0c99c64681895219f964aac7af" "fc2782b33667eb932e4ffe9dac475f898bf7c656f8ba60e2276704fabb7fa63b" "96b023d1a6e796bab61b472f4379656bcac67b3af4e565d9fb1b6b7989356610" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7ed6913f96c43796aa524e9ae506b0a3a50bfca061eed73b66766d14adfa86d1" "0795e2c85394140788d72d34969be4acb305e4a54149e7237787d9df27832fbb" "0d19ff470ad7029d2e1528b3472ca2d58d0182e279b9ab8acd65e2508845d2b6" "c739f435660ca9d9e77312cbb878d5d7fd31e386a7758c982fa54a49ffd47f6e" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "f0ea6118d1414b24c2e4babdc8e252707727e7b4ff2e791129f240a2b3093e32" "5ceb2e85215142caad4c2abc1061c0bade80348c4eb323934a909e36f864d5bc" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "91b5a381aa9b691429597c97ac56a300db02ca6c7285f24f6fe4ec1aa44a98c3" "39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "a30d5f217d1a697f6d355817ac344d906bb0aae3e888d7abaa7595d5a4b7e2e3" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "968d1ad07c38d02d2e5debffc5638332696ac41af7974ade6f95841359ed73e3" "2b5aa66b7d5be41b18cc67f3286ae664134b95ccc4a86c9339c886dfd736132d" "7dd515d883520286fc8936ce32381fb01b978d0d7cfb6fe56f7f55d8accbf63a" "8eef22cd6c122530722104b7c82bc8cdbb690a4ccdd95c5ceec4f3efa5d654f5" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "7fa9dc3948765d7cf3d7a289e40039c2c64abf0fad5c616453b263b601532493" "5dfacaf380068d9ed06e0872a066a305ab6a1217f25c3457b640e76c98ae20e6" "427234e4b45350b4159575f1ac72860c32dce79bb57a29a196b9cfb9dd3554d9" "d293542c9d4be8a9e9ec8afd6938c7304ac3d0d39110344908706614ed5861c9" "c7359bd375132044fe993562dfa736ae79efc620f68bab36bd686430c980df1c" "7153b82e50b6f7452b4519097f880d968a6eaf6f6ef38cc45a144958e553fbc6" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "e57e7b19da7b4cd0e5512d5e9bc20d31c9cf50112c462de15a76bce0ea3c5ef5" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(package-selected-packages
   (quote
    (hc-zenburn-theme gruvbox-theme grandshell-theme flatui-theme flatui-dark-theme exotica-theme darcula-theme darkmine-theme darkroom darktooth-theme dark-mint-theme atom-dark-theme atom-one-dark-theme nyx-theme darkokai-theme darkburn-theme dark-krystal-theme badger-theme abyss-theme slime-theme slime zenburn-theme yaml-mode xml-rpc vline twittering-mode tss tronesque-theme tommyh-theme swiper sunny-day-theme sublime-themes solarized-theme soft-morning-theme soft-charcoal-theme smex rust-mode ruby-tools ruby-test-mode ruby-guard rspec-mode rinari restclient railscasts-theme rails-new rails-log-mode pyvirtualenv python-pylint python-pep8 python-mode python projectile-rails paredit org-reveal org-doing nvm nodejs-repl multiple-cursors multi-term mode-compile markdown-mode magit js-comint jira jabber indent-guide iedit ido-ubiquitous idle-highlight-mode hippie-expand-haskell heroku-theme heroku helm-rails helm-go-package hackernews govet gotham-theme gorepl-mode golint god-mode go-stacktracer go-snippets go-scratch go-projectile go-playground-cli go-playground go-play go-errcheck go-dlv go-direx go-complete go-autocomplete github-theme git-rebase-mode git-commit-mode gandalf-theme flymake-ruby flymake-json flymake-jslint flymake-cursor flatland-theme firebelly-theme find-file-in-project exec-path-from-shell eieio distinguished-theme deep-thought-theme cyberpunk-theme company-go color-theme-wombat color-theme-wombat+ color-theme-vim-insert-mode color-theme-twilight color-theme-tangotango color-theme-tango color-theme-solarized color-theme-railscasts color-theme-monokai color-theme-molokai color-theme-library color-theme-ir-black color-theme-heroku color-theme-gruber-darker color-theme-github color-theme-emacs-revert-theme color-theme-eclipse color-theme-dpaste color-theme-dg color-theme-dawn-night color-theme-complexity color-theme-colorful-obsolescence color-theme-cobalt color-theme-buffer-local color-theme-blackboard color-theme-actress color-theme-active clojure-project-mode circe cider-spy cider-profile cider-decompile calmer-forest-theme busybee-theme assemblage-theme ample-zen-theme ample-theme alect-themes adjust-parens ac-js2 ac-inf-ruby ac-cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (setq gofmt-command "goimports")
;; (add-to-list 'load-path "/Users/shawnpage/.emasc.d/elpa")
;; (require 'go-mode-load)
;; (add-hook 'before-save-hook 'gofmt-before-save)


;; (add-to-list 'load-path "/Users/shawnpage/.emacs.d/elpa/go-mode-20150503.258/go-mode.el")
;; (require 'go-mode-autoloads)

; Go programming hooks

(setenv "GOPATH" "/Users/shawnpage/go")

(require 'go-mode)
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-g") 'go-goto-imports)))
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-f") 'gofmt)))
(add-hook 'go-mode-hook '(lambda ()
  (local-set-key (kbd "C-c C-k") 'godoc)))

(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

;(require 'go-autocomplete)
;(require 'auto-complete-config)

;(require 'helm-config)
;(helm-mode 1)
