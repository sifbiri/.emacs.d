(defalias 'sup 'straight-use-package)
(straight-use-package 'use-package)
(setq straight-use-package-by-default 't)
(setq straight-enable-use-package-integration 't)
(disable-theme 'zenburn)
(use-package modus-themes :ensure t
  :init (setq modus-themes-operandi-color-overrides
              '((bg-main . "#f7f7f7"))
              modus-themes-vivendi-color-overrides
              '((bg-main . "#030303")))
  (modus-themes-load-themes))

;; (use-package modus-themes :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(align-lisp-modes
   '(emacs-lisp-mode lisp-interaction-mode lisp-mode scheme-mode clojure-mode clojuresript-mode clojurec-mode))
 '(ansi-color-faces-vector
   [default bold shadow italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(auto-dark-emacs/allow-osascript t)
 '(auto-dark-emacs/dark-theme 'modus-vivendi)
 '(auto-dark-emacs/light-theme 'modus-operandi)
 '(awesome-tray-mode-line-active-color "#2fafff")
 '(awesome-tray-mode-line-inactive-color "#323232")
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(css-fontify-colors nil)
 '(custom-safe-themes
   '("8a6a364d1ddaab9c7dfda9e69a888e597d04bacf98505b45da0963e45c5b0cbb" "d0fb0c463d5d61e93f920e0fd1aa4c023bf719874b4d08f7f473b46c4adc0682" "6fc03df7304728b1346091dd6737cb0379f348ddc9c307f8b410fba991b3e475" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" default))
 '(diff-hl-draw-borders nil)
 '(dired-sidebar-subtree-line-prefix "  ")
 '(dired-sidebar-theme 'ascii)
 '(dired-sidebar-use-custom-font nil)
 '(exwm-floating-border-color "#646464")
 '(fci-rule-color "#383838")
 '(flymake-error-bitmap '(flymake-double-exclamation-mark modus-themes-fringe-red))
 '(flymake-note-bitmap '(exclamation-mark modus-themes-fringe-cyan))
 '(flymake-warning-bitmap '(exclamation-mark modus-themes-fringe-yellow))
 '(global-hl-line-mode t)
 '(half-width '("half-width" . 0) t)
 '(highlight-indent-guides-bitmap-function 'highlight-indent-guides---line)
 '(highlight-indent-guides-character 9474)
 '(highlight-indent-guides-method 'character)
 '(highlight-indent-guides-responsive nil)
 '(highlight-tail-colors '(("#2f4a00" . 0) ("#00415e" . 20)))
 '(hl-todo-keyword-faces
   '(("HOLD" . "#c0c530")
     ("TODO" . "#feacd0")
     ("NEXT" . "#b6a0ff")
     ("THEM" . "#f78fe7")
     ("PROG" . "#00d3d0")
     ("OKAY" . "#4ae2f0")
     ("DONT" . "#70b900")
     ("FAIL" . "#ff8059")
     ("BUG" . "#ff8059")
     ("DONE" . "#44bc44")
     ("NOTE" . "#d3b55f")
     ("KLUDGE" . "#d0bc00")
     ("HACK" . "#d0bc00")
     ("TEMP" . "#ffcccc")
     ("FIXME" . "#ff9077")
     ("XXX+" . "#ef8b50")
     ("REVIEW" . "#6ae4b9")
     ("DEPRECATED" . "#bfd9ff")))
 '(ibuffer-deletion-face 'modus-themes-mark-del)
 '(ibuffer-filter-group-name-face 'modus-themes-pseudo-header)
 '(ibuffer-marked-face 'modus-themes-mark-sel)
 '(ibuffer-title-face 'default)
 '(line-number-mode nil)
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-sideline-enable nil)
 '(midnight-mode t)
 '(modus-themes-completions 'moderate)
 '(modus-themes-intense-hl-line t)
 '(modus-themes-italic-constructs t)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(org-src-block-faces 'nil)
 '(package-selected-packages
   '(highlight-parentheses highlight-indent-guides pretty-symbols clojure-mode-extra-font-locking paren-face dash-at-point dired-sidebar unicode-fonts clojure-mode modus-themes yaml-mode web-mode lsp-ui lsp-mode json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters company counsel swiper ivy exec-path-from-shell zop-to-char zenburn-theme which-key volatile-highlights undo-tree super-save smartrep smartparens operate-on-number nlinum move-text magit projectile imenu-anywhere hl-todo guru-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region epl editorconfig easy-kill diminish diff-hl discover-my-major crux browse-kill-ring anzu ag ace-window))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(pixel-scroll-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(warning-suppress-log-types
   '((lsp-mode)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)))
 '(warning-suppress-types
   '((comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)))
 '(xterm-color-names
   ["black" "#ff8059" "#44bc44" "#d0bc00" "#2fafff" "#feacd0" "#00d3d0" "gray65"])
 '(xterm-color-names-bright
   ["gray35" "#ef8b50" "#70b900" "#c0c530" "#79a8ff" "#f78fe7" "#4ae2f0" "white"]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Triplicate A Code" :foundry "nil" :slant normal :weight normal :height 120 :width normal)))))


(setq prelude-whitespace nil)
(require 'unicode-fonts)
(unicode-fonts-setup)

;; (load-file "˜/Desktop/hackerrank.el")

(add-hook 'dired-sidebar-mode-hook
          (lambda ()
            (unless (file-remote-p default-directory)
              (auto-revert-mode))))
:config
;; (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
;; (push 'rotate-windows dired-sidebar-toggle-hidden-commands)


(setq dired-sidebar-subtree-line-prefix "_")
;; (setq dired-sidebar-theme 'vscode)
(setq dired-sidebar-use-term-integration t)
(setq dired-sidebar-use-custom-font nil)

(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))

(defun refresh-indent-guides ()
  (interactive)
  (highlight-indent-guides-mode 0)
  (highlight-indent-guides-mode 1))

(global-set-key (kbd "C-c C-d C-l") 'dash-at-point)

(defun lsp-start ()
  (do (lsp)
      (lsp-headerline-breadcrumb-enable -1)))


;; (add-hook 'clojure-mode-hook 'lsp-start)
;; (add-hook 'clojurescript-mode-hook 'lsp-start)
;;  (add-hook 'clojurec-mode-hook 'lsp-start)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-minimum-prefix-length 1
      lsp-lens-enable nil
      lsp-signature-auto-activate nil
      lsp-headerline-breadcrumb-enable nil
      lsp-ui-doc-show-with-mouse nil
      lsp-ui-doc-show-with-cursor nil
      lsp-ui-doc-enable nil
      lsp-ui-sideline-enable nil
      lsp-ui-sideline-show-hover nil

      lsp-modeline-code-actions-enable nil
      lsp-ui-sideline-show-code-actions nil
      ;; lsp-completion-provider :none
      ;sp-diagnostics-provider :auto
      lsp-diagnostics-provider :auto
      )



                                        ; lsp-enable-indentation nil ; uncomment to use cider indentation instead of lsp
                                        ; lsp-enable-completion-at-point nil ; uncomment to use cider completion instead of lsp

(add-hook 'lsp-mode-hook (lambda () (lsp-headerline-breadcrumb-mode -1)))
(add-hook 'lsp-mode-hook (lambda () (lsp-ui-sideline-mode -1)))
(add-hook 'lsp-mode-hook (lambda () (lsp-ui-mode -1)))


;; (setq modus-themes-syntax '(alt-syntax  faint))
(setq modus-themes-syntax '(alt-syntax))
(global-hl-line-mode +1)

;;faint
(setq modus-themes-italic-constructs 't)
(setq modus-themes-bold-constructs 't)
(setq modus-themes-mode-line '(borderless))
(setq modus-themes-hl-line '(intense))
(setq modus-themes-subtle-line-number 't)
;(global-hl-line-mode 0)
                                        ;(setq line-spacing 0)

(fringe-mode '(8 . 0))

(setq line-spacing 1)
(pretty-symbols-mode +1)
                                        ;(setq highlight-indent-guides-method 'bitmap)
;; (setq highlight-indent-guides-method 'character)

;; (setq highlight-indent-guides-highlighter-function #'highlight-indent-guides--highlighter-default)


;; (set-background-color "#e8e8e8")
;; (setq line-spacing 0)

(require 'clojure-mode-extra-font-locking)
;; (setq line-spacing 0.1)
;; (setq line-spacing 0.2)
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)
;; (setq modus-themes-lang-checkers '(faint))
(setq modus-themes-lang-checkers '(faint))
(setq modus-themes-paren-match '(bold))
(setq modus-themes-fringes 'subtle)
(setq modus-themes-hl-line '(intense))


(setq modus-themes-completions 'opinionated)
;(setq modus-themes-hl-line '(accented))
(setq modus-themes-hl-line 'nil)
(setq modus-themes-prompts '(background gray bold))
;; (setq modus-themes-italic-constructs nil)
(global-display-line-numbers-mode -1)
;;(load-theme 'modus-vivendi)
;; (load-theme 'modus-operandi)
;; (set-cursor-color "#fe6060")
(global-visual-line-mode -1)
;; (load "~/Desktop/Bureau/hackerrank.el")


(global-prettify-symbols-mode +1)


;; (defun system-dark-mode-enabled-p ()
;;   "Check if dark mode is currently enabled on OSX."
;;   (if (string= system-type "darwin")
;;       (string=
;;        (shell-command-to-string "printf %s \"$( osascript -e \'tell application \"System Events\" to tell appearance preferences to return dark mode\' )\"")
;;        "true")
;;     nil))

;; (defun match-emacs-theme-to-system ()
;;   "Automatically set the theme to match if OSX is in dark mode."
;;   (interactive)

;;   (if (system-dark-mode-enabled-p)
;;       (modus-themes-load-vivendi)
;;     (modus-themes-load-operandi)))
;; (match-emacs-theme-to-system)

(add-to-list 'load-path "~/.emacs.d/vendor/auto-dark-emacs.el")
(require 'auto-dark-emacs)

                                        ; (setq show-paren-style nil)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))



(add-hook 'prog-mode-hook #'highlight-parentheses-mode)
(add-hook 'prog-mode-hook #'visual-line-mode)
;; (add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)
;; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(setq package-enable-at-startup nil)
;; (when (commandp 'counsel-M-x)
;;   (global-set-key [remap execute-extended-command] #'counsel-M-x))

(setq suggest-key-bindings 't)
(setq line-spacing 1)

(defun modus-themes-toggle ()
  "Toggle between `modus-operandi' and `modus-vivendi' themes.
Also runs `modus-themes-after-load-theme-hook' at its last stage
by virtue of calling either of `modus-themes-load-operandi' and
`modus-themes-load-vivendi' functions."
  (interactive)
  (modus-themes-load-themes)
  (pcase (modus-themes--current-theme)
    ('modus-operandi (modus-themes-load-vivendi))
    ('modus-vivendi (modus-themes-load-operandi))
    (_ (modus-themes--load-prompt))))



;; (set-background-color "black")




;; (highlight-indent-guides-mode -1)
;;
;; (set-background-color "#F2F2F2")

;; (set-background-color "white")

;; (modus-themes-toggle)
;; (set-background-color "#191919")
;; (set-background-color "#333333")

;; (set-background-color "white")
                                        ;
;; (set-background-color "black")


(straight-use-package 'highlight-indent-guides)
(straight-use-package 'highlight-parentheses)
(straight-use-package 'amx)
(straight-use-package 'marginalia)


(marginalia-mode +1)
;; (setqd;; efault indicate-empty-lines t)
;; (setq create-lockfiles nil)

;; (add-to-list 'auto-mode-alist '("\\.cvx\\'" . clojure-mode))
;; (require 'org)
;; (require 'ob-clojure)

(setq org-babel-clojure-backend 'cider)
(require 'cider)

;; (let ((ar-font "Geeza Pro")
;;       (range '(#x000600 . #x0006FF)))
;;   (set-fontset-font "fontset-startup"  range ar-font)
;;   (set-fontset-font "fontset-default"  range ar-font)
;;   (set-fontset-font "fontset-standard" range ar-font))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js-jsx-mode))
(add-hook 'js2-jsx-mode 'js2-minor-mode)

;; (set-background-color "#00000")

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "DOING(g)" "|" "DONE(d)"))))

;; (setq org-todo-keywords
;;       (quote ((sequence "TODO" "DOING" "|" "DONE"))))

(sup 'ejc-sql)
(sup 'auto-complete)
(sup 'flx-ido)
(require 'ejc-sql)

(require 'ejc-autocomplete)
(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (auto-complete-mode t)
            (ejc-ac-setup)))


(setq ejc-use-flx t)
(setq ejc-flx-threshold 2)

(require 'ejc-company)
(push 'ejc-company-backend company-backends)
(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (company-mode t)))

(setq ejc-complete-on-dot t)

(sup 'company-quickhelp)

(company-quickhelp-mode)

(setq ejc-completion-system 'standard)

(add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (ejc-eldoc-setup)))

(add-hook 'ejc-sql-connected-hook
          (lambda ()
            (ejc-set-fetch-size nil)
            (ejc-set-max-rows nil)
            (ejc-set-show-too-many-rows-message nil)
            (ejc-set-column-width-limit 30)
            (ejc-set-use-unicode t)))

(setq ejc-result-table-impl 'ejc-result-mode)

(ejc-create-connection
 "ceodev"
 :dependencies [[org.postgresql/postgresql "42.3.2"]]
 ;; :classpath (concat "~/.m2/repository/postgresql/postgresql/9.3.1102.jdbc41/"
 ;;                    "postgresql-9.3-1102.jdbc41.jar")
 :subprotocol "postgresql"
 :subname "//localhost:5432/ceo"
 :user "ceo"
 :password "ceo")

(global-set-key (kbd "C-c jc") 'ejc-get-temp-editor-buffer)

;; (setq clomacs-allow-other-repl t)


(add-hook 'sql-mode-hook 'lsp)
(setq lsp-sqls-workspace-config-path nil)
(setq lsp-sqls-connections
      '( ((driver . "postgresql") (dataSourceName . "host=127.0.0.1 port=5432 user=ceo password=ceo dbname=ceo sslmode=disable"))))

(setq lsp-sqls-server "/Users/sifoub/go/bin/sqls")




;; (defun td/adapt-font-size (&optional frame)
;;   (let* ((attrs (frame-monitor-attributes frame))
;;          (size (alist-get 'mm-size attrs))
;;          (geometry (alist-get 'geometry attrs))
;;          (ppi (/ (caddr geometry) (/ (car size) 25.4))))
;;     ;;(message "PPI: %s" ppi)
;;     (if (> ppi 120)
;;         (set-face-attribute 'default frame :height 140)
;;       (set-face-attribute 'default frame :height 120))))

(require 'cl-lib)
(defun sif/adjust-font-size (frame)
  "Inspired by https://emacs.stackexchange.com/a/44930/17066. FRAME is ignored.
If I let Windows handle DPI everything looks blurry."
  (let* ((attrs (frame-monitor-attributes)) ;; gets attribs for current frame
         (monitor-name (alist-get 'name attrs))
         (width-mm (cl-first (alist-get 'mm-size attrs)))
         (width-px (cl-third (alist-get 'workarea attrs)))
         (size 150)) ;; default size, go big just in case
    (when (< width-mm 400)
      (setq size 120))
    (set-face-attribute 'default (selected-frame) :height size)
    width-mm))

(defun fix-font-size () (interactive) (sif/adjust-font-size (selected-frame)))
(add-hook 'window-size-change-functions #'sif/adjust-font-size)
;; (add-function :after after-focus-change-function #'sif/adjust-font-size)
;; (add-hook 'after-make-frame-functions #'sif/adjust-font-size)
;; (push 'sif/adjust-font-size after-make-frame-functions)



(sup 'xref)
(setq xref-search-program 'ripgrep)
(when (functionp 'xref--show-defs-minibuffer)
  (setq xref-show-definitions-function 'xref--show-defs-minibuffer)
  (setq xref-show-xrefs-function 'xref--show-defs-minibuffer))
(sup 'consult :disabled)
(sup 'consult-lsp :disabled)



(setq flycheck-indication-mode 'left-fringe)


;; (define-fringe-bitmap 'flycheck-fringe-bitmap-ball
;;   (vector))

;; (flycheck-define-error-level 'error
;;   :severity 200
;;   :compilation-level 2
;;   :overlay-category 'flycheck-error-overlay
;;   :fringe-bitmap 'flycheck-fringe-bitmap-ball
;;   :fringe-face 'flycheck-fringe-error
;;   :error-list-face 'flycheck-error-list-error)

;; (flycheck-define-error-level 'warning
;;   :severity 100
;;   :compilation-level 1
;;   :overlay-category 'flycheck-warning-overlay
;;   :fringe-bitmap 'flycheck-fringe-bitmap-ball
;;   :fringe-face 'flycheck-fringe-warning
;;   :error-list-face 'flycheck-error-list-warning)

;; (flycheck-define-error-level 'info
;;   :severity 000
;;   :compilation-level 0
;;   :overlay-category 'flycheck-info-overlay
;;   :fringe-bitmap 'flycheck-fringe-bitmap-ball
;;   :fringe-face 'flycheck-fringe-info
;;   :error-list-face 'flycheck-error-list-info)

;; (setq overline-margin 0)



(sup 'project)


(defun find-refs ()
  (interactive)
  (lsp-find-references t))

(defun find-definition ()
  "Try to find definition of cursor via LSP otherwise fallback to cider."
  (interactive)
  (let ((cursor (point))
        (buffer (current-buffer)))
    (lsp-find-definition)
    (when (and (eq buffer (current-buffer))
               (eq cursor (point)))
      (cider-find-var))))

(define-key clojure-mode-map (kbd "M-.") #'find-definition)
(define-key cider-mode-map (kbd "M-.") #'find-definition)
(define-key clojurec-mode-map (kbd "M-.") #'find-definition)
(define-key clojurescript-mode-map (kbd "M-.") #'find-definition)

(sup 'lsp-mode)
(sup 'lsp-ui)
(require 'lsp-ui)
(require 'lsp-ui-imenu)

(setq lsp-clojure-custom-server-command '("bash" "-c" " /usr/local/bin/clojure-lsp"))
;;(setq lsp-clojure-custom-server-command nil)


(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
(define-key lsp-ui-mode-map (kbd "C-c C-l .") 'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map (kbd "C-c C-l ?") 'lsp-ui-peek-find-references)
(define-key lsp-ui-mode-map (kbd "C-c C-l r") 'lsp-rename)
(define-key lsp-ui-mode-map (kbd "C-c C-l x") 'lsp-workspace-restart)
(define-key lsp-ui-mode-map (kbd "C-c C-l w") 'lsp-ui-peek-find-workspace-symbol)
(define-key lsp-ui-mode-map (kbd "C-c C-l i") 'lsp-ui-peek-find-implementation)
(define-key lsp-ui-mode-map (kbd "C-c C-l d") 'lsp-describe-thing-at-point)
(define-key lsp-ui-mode-map (kbd "C-c C-l e") 'lsp-execute-code-action)

(setq lsp-ui-sideline-enable t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-peek-enable t)
(setq lsp-ui-peek-always-show t)
 
;; (set-background-color "#14191e")
;; (set-background-color "black")


;; JS


(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))

;; (set-background-color "black")
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(global-display-line-numbers-mode)
(global-prettify-symbols-mode -1)

(add-hook 'prog-mode-hook #'lsp)

(with-eval-after-load 'js
  (define-key js-mode-map (kbd "M-.") nil))


(use-package
  embark
  :ensure t
  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
       ("C-;" . embark-dwim)        ;; good alternative: M-.
       ("C-h B" . embark-bindings)))

;;(load-theme 'modus-vivendi)
;; (set-background-color "#050505")
;; (set-background-color "#080808")
;; (set-background-color "#030303")
;;(set-background-color "#020202")
;; (set-background-color "black")
;;(set-background-color "#080808")

(use-package rjsx-mode)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
;; ident by tabs
;; (setq-local indent-line-function 'js-jsx-indent-line)

;; (with-eval-after-load 'rjsx-mode
;;   (define-key rjsx-mode-map "<" nil)
;;   (define-key rjsx-mode-map (kbd "C-d") nil)
;;   (define-key rjsx-mode-map ">" nil))

(defun lsp--eslint-before-save (orig-fun)
  "Run lsp-eslint-apply-all-fixes and then run the original lsp--before-save."
  (when lsp-eslint-auto-fix-on-save (lsp-eslint-apply-all-fixes))
  (funcall orig-fun))
(setq lsp-eslint-auto-fix-on-save t)
(advice-add 'lsp--before-save :around #'lsp--eslint-before-save)

(global-set-key (kbd "C-x p i") 'projectile-ripgrep)
;; (setq dired-sidebar-subtree-line-prefix " ")


;; Packages without config 
(use-package magit)
(use-package magit-popup)
(use-package magit-section)

;; (progn (set-background-color "#f7f7f7") 'modus-operandi)

;; (setq highlight-indent-guides-bitmap-function 'highlight-indent-guides--bitmap-line)

;; (if (eq (car custom-enabled-themes) 'modus-operandi)
;;     (set-background-color "#f7f7f7")
;;   (set-background-color "#030303"))
;; (set-background-color "#f7f7f7") ;; 3%
;; (set-background-color "#fafafa") ;; 2%
;; (set-background-color "white")

;; (highlight-indent-guides-mode 0)

(use-package html-to-hiccup
  :ensure t
  :config
  (define-key clojure-mode-map (kbd "H-h") 'html-to-hiccup-convert-region))

(setq clojure-indent-style 'align-arguments)
(setq clojure-align-forms-automatically t)

(use-package aggressive-indent
  :ensure t
  :config
  (global-aggressive-indent-mode 1))

(setq whitespace-style '(face tabs spaces trailing lines space-before-tab newline indentation empty space-after-tab space-mark tab-mark newline-mark missing-newline-at-eof))

(setq css-fontify-colors nil)
(global-visual-line-mode 1)
