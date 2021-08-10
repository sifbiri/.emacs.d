;; (load ~/.emacs.d/custom.el)
;; (load "~/.emacs.d/personal/init.el")
(tool-bar-mode -1)
(scroll-bar-mode -1)



(modus-themes-load-vivendi)


                                        ;(add-to-list 'exec-path " ")


(setq-default company-idle-delay 0.2)
;; (add-to-list 'eglot-server-programs '(clojure-mode . ("clojure-lsp")))
;; (add-to-list 'eglot-server-programs '(clojurec-mode . ("clojure-lsp" )))
;; (add-to-list 'eglot-server-programs '(clojurescript-mode . ("clojure-lsp")))
;; (add-to-list 'eglot-server-programs '(clojure-mode . ("clojure-lsp")))
;; (add-hook 'clojure-mode-hook 'eglot-ensure)
;; (add-hook 'clojurescript-mode-hook 'eglot-ensure)
;; (add-hook 'clojurec-mode-hook 'eglot-ensure)


(tool-bar-mode 0)
(global-hl-line-mode 1)
(global-display-line-numbers-mode 1)


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


(when (memq window-system '(mac ns))
  (setenv "SHELL" "/bin/zsh")
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(scroll-bar-mode 0)

(mlscroll-mode 1)

;; (define-key clojure-mode-map (kbd "M-.") #'find-definition)
;; (define-key cider-mode-map (kbd "M-.") #'find-definition)
;; ;; (define-key clojurec-mode-map (kbd "M-.") #'find-definition)
;; (define-key clojurescript-mode-map (kbd "M-.") #'find-definition)
;; 

;(add-hook 'clojurec-mode-map #'enable-paredit-mode)
;; 
;; 
;; (add-hook 'clojure-mode-hook 'lsp)
;; (add-hook 'clojurescript-mode-hook 'lsp)
;; (add-hook 'clojurec-mode-hook 'lsp)
(global-eldoc-mode 1)

(eval-after-load 'lsp-mode
  (progn
    (require 'lsp-sourcekit)
    (setq lsp-sourcekit-executable (string-trim (shell-command-to-string "xcrun --find sourcekit-lsp"))) ))

(add-hook 'swift-mode-hook (lambda () (lsp)))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      lsp-headerline-breadcrumb-enable nil
      company-idle-delay 0.5
      lsp-idle-delay 0.5
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-enable-file-watchers nil
      lsp-file-watch-threshold 10000
      lsp-signature-auto-activate nil
      lsp-clojure-custom-server-command '("/opt/homebrew/Cellar/clojure-lsp/20210601T161944/bin/clojure-lsp")
      lsp-diagnostics-provider :auto
      lsp-enable-indentation nil ;; uncomment to use cider indentation instead of lsp
      ;; lsp-enable-completion-at-point nil ;; uncomment to use cider completion instead of lsp

      lsp-completion-provider :capf
      lsp-enable-on-type-formatting nil)



(load "custom.el")

(custom-set-variables '(highlight-indent-guides-method 'bitmap)
			          '(line-spacing 0.1)
			          ;; '(modus-theme-syntax 'nil)
			          ;; '(modus-themes-paren-match 'intense-bold)
			          ;; '(modus-themes-mode-line 'borderless-3d)
			          )

                                        ;  (set-face-attribute 'default nil :family "SF Mono" :height 120 :weight 'medium)
                                        ;(setq-default line-spacing 0.2)

                                        ;  (global-display-line-numbers-mode -1)
(setq-default company-idle-delay 0.2)

(defun sidebar-toggle ()
  "Toggle both `dired-sidebar' and `ibuffer-sidebar'."
  (interactive)
  (dired-sidebar-toggle-sidebar)
  (ibuffer-sidebar-toggle-sidebar))


(global-set-key (kbd "C-x j") 'dired-sidebar-toggle-sidebar)

;; (defun my-clojure-mode-hook ()
;;   (clj-refactor-mode 1)
;;   (yas-minor-mode 1) ; for adding require/use/import statements
;;   ;; This choice of keybinding leaves cider-macroexpand-1 unbound
;;   (cljr-add-keybindings-with-prefix "C-c C-m"))
;; 
;; (setq cljr-favor-prefix-notation nil)
;; 
;; (add-hook 'clojure-mode-hook #'my-clojure-mode-hook)




;; (defun find-refs ()
;;   (interactive)
;;   (lsp-find-references t))
;; 
;; (defun find-definition ()
;;   "Try to find definition of cursor via LSP otherwise fallback to cider."
;;   (interactive)
;;   (let ((cursor (point))
;; 	    (buffer (current-buffer)))
;;     (lsp-find-definition)
;;     (when (and (eq buffer (current-buffer))
;; 		       (eq cursor (point)))
;; 	  (cider-find-var))))


;; (require 'clojure-mode)
;; (require 'cider)
;; (define-key clojure-mode-map (kbd "M-.") #'find-definition)
;; (define-key cider-mode-map (kbd "M-.") #'find-definition)
;; (define-key clojurec-mode-map (kbd "M-.") #'find-definition)
;; (define-key clojurescript-mode-map (kbd "M-.") #'find-definition)


(setq clojure-align-separator 'entire)
(add-hook 'lsp-mode-hook (lambda () (lsp-headerline-breadcrumb-mode -1)))


                                        ;(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

;; custom varaibles // TODO group them

(desktop-save-mode 1)


                                        ;(set-face-attribute 'cursor nil :background (modus-themes-color-alts 'blue 'red))
(require 'which-key)
                                        ;  (setq eglot-ignored-server-capabilites '(:documentHighlightProvider))
(setq lsp-eldoc-enable-hover 't)
(setq lsp-signature-auto-activate 't)
(setq lsp-signature-render-documentation 't)
(setq lsp-eldoc-enable-hover 'nil)
(setq lsp-eldoc-render-all 'nil)
(setq lsp-ui-doc-enable nil)
                                        ; (prot-emacs-elpa-package 'exec-path-from-shell-initialize)
(prot-emacs-elpa-package 'lsp
  (setq gc-cons-threshold (* 100 1024 1024)
        read-process-output-max (* 1024 1024)
        treemacs-space-between-root-nodes nil
        lsp-headerline-breadcrumb-enable nil
        company-idle-delay 0.5
        lsp-idle-delay 0.5
        company-minimum-prefix-length 1
        lsp-lens-enable t
        lsp-enable-file-watchers nil
        lsp-file-watch-threshold 10000
        lsp-signature-auto-activate nil
        lsp-clojure-custom-server-command '("/opt/homebrew/bin/clojure-lsp")
        lsp-diagnostics-provider :auto
        lsp-enable-indentation nil ;; uncomment to use cider indentation instead of lsp
        ;; lsp-enable-completion-at-point nil ;; uncomment to use cider completion instead of lsp

        lsp-completion-provider :capf
        lsp-enable-on-type-formatting nil)
  (add-hook 'clojure-mode-hook 'lsp)
  (add-hook 'clojurescript-mode-hook 'lsp)
  (add-hook 'clojurec-mode-hook 'lsp)
  )


(prot-emacs-elpa-package 'clojure-mode
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

  (define-key clojurec-mode-map (kbd "M-.") #'find-definition)
  (define-key clojurescript-mode-map (kbd "M-.") #'find-definition)
  
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'cider-mode-hook #'enable-paredit-mode)
  (add-hook 'clojurescript-mode-hook #'enable-paredit-mode))


(prot-emacs-elpa-package 'paredit
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'clojurescript-mode-hook 'paredit-mode)
  (add-hook 'clojurec-mode-hook 'paredit-mode))
(prot-emacs-elpa-package 'clojure-mode-extra-font-locking)
(prot-emacs-elpa-package 'company
  (global-company-mode +1))
(prot-emacs-elpa-package 'cider
    (define-key cider-mode-map (kbd "M-.") #'find-definition))
(prot-emacs-elpa-package 'exec-path-from-shell)
(prot-emacs-elpa-package 'dired-sidebar)


(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


(prot-emacs-elpa-package 'swift-mode)
;; (prot-emacs-install-ensured 'exec-path-from-shell-initialize)

                                        ;(which-key-mode)
(load "custom.el")
