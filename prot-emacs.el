(prot-emacs-builtin-package 'prot-common)

(prot-emacs-builtin-package 'prot-simple
  (setq prot-simple-insert-pair-alist
        '(("' Single quote"        . (39 39))     ; ' '
          ("\" Double quotes"      . (34 34))     ; " "
          ("` Elisp quote"         . (96 39))     ; ` '
          ("‘ Single apostrophe"   . (8216 8217)) ; ‘ ’
          ("“ Double apostrophes"  . (8220 8221)) ; “ ”
          ("( Parentheses"         . (40 41))     ; ( )
          ("{ Curly brackets"      . (123 125))   ; { }
          ("[ Square brackets"     . (91 93))     ; [ ]
          ("< Angled brackets"     . (60 62))     ; < >
          ("« Εισαγωγικά Gr quote" . (171 187))   ; « »
          ("= Equals signs"        . (61 61))     ; = =
          ("~ Tilde"               . (126 126))   ; ~ ~
          ("* Asterisks"           . (42 42))     ; * *
          ("_ underscores"         . (95 95))))   ; _ _
  (setq prot-simple-date-specifier "%F")
  (setq prot-simple-time-specifier "%R %z")
  (setq delete-pair-blink-delay 0.15) ; Emacs28 -- see `prot-simple-delete-pair-dwim'

  ;; General commands
  (let ((map global-map))
    (define-key map (kbd "<insert>") nil)
    (define-key map (kbd "C-z") nil)
    (define-key map (kbd "C-x C-z") nil)
    (define-key map (kbd "C-h h") nil)
    (define-key map (kbd "M-`") nil)
    (define-key map (kbd "s-h") #'prot-simple-describe-symbol)
    (define-key map (kbd "C-h K") #'describe-keymap) ; overrides `Info-goto-emacs-key-command-node'
    ;; Commands for lines
    (define-key map (kbd "C-S-w") #'prot-simple-copy-line-or-region)
    (define-key map (kbd "C-S-y") #'prot-simple-yank-replace-line-or-region)
    (define-key map (kbd "M-SPC") #'cycle-spacing)
    (define-key map (kbd "M-o") #'delete-blank-lines)   ; alias for C-x C-o
    (define-key map (kbd "M-k") #'prot-simple-kill-line-backward)
    (define-key map (kbd "C-S-n") #'prot-simple-multi-line-next)
    (define-key map (kbd "C-S-p") #'prot-simple-multi-line-prev)
    (define-key map (kbd "<C-return>") #'prot-simple-new-line-below)
    (define-key map (kbd "<C-S-return>") #'prot-simple-new-line-above)
    ;; Commands for text insertion or manipulation
    (define-key map (kbd "C-=") #'prot-simple-insert-date)
    (define-key map (kbd "C-<") #'prot-simple-escape-url)
    (define-key map (kbd "C-'") #'prot-simple-insert-pair-completion)
    (define-key map (kbd "M-'") #'prot-simple-insert-pair-completion)
    (define-key map (kbd "M-\\") #'prot-simple-delete-pair-dwim)
    (define-key map (kbd "C-M-;") #'prot-simple-cite-region)
    (define-key map (kbd "C-M-^") #'prot-simple-insert-undercaret)
    (define-key map (kbd "<C-M-backspace>") #'backward-kill-sexp)
    (define-key map (kbd "M-c") #'capitalize-dwim)
    (define-key map (kbd "M-l") #'downcase-dwim)        ; "lower" case
    (define-key map (kbd "M-u") #'upcase-dwim)
    ;; Commands for object transposition
    (define-key map (kbd "C-t") #'prot-simple-transpose-chars)
    (define-key map (kbd "C-x C-t") #'prot-simple-transpose-lines)
    (define-key map (kbd "C-S-t") #'prot-simple-transpose-paragraphs)
    (define-key map (kbd "C-x M-t") #'prot-simple-transpose-sentences)
    (define-key map (kbd "C-M-t") #'prot-simple-transpose-sexps)
    (define-key map (kbd "M-t") #'prot-simple-transpose-words)
    ;; Commands for marking objects
    (define-key map (kbd "M-@") #'prot-simple-mark-word)       ; replaces `mark-word'
    (define-key map (kbd "C-M-SPC") #'prot-simple-mark-construct-dwim)
    (define-key map (kbd "C-M-d") #'prot-simple-downward-list)
    ;; Commands for paragraphs
    (define-key map (kbd "M-Q") #'prot-simple-unfill-region-or-paragraph)
    ;; Commands for windows
    (define-key map (kbd "s-m") #'prot-simple-monocle)
    ;; Commands for buffers
    (define-key map (kbd "M-=") #'count-words)
    (define-key map (kbd "<C-f2>") #'prot-simple-rename-file-and-buffer)
    (define-key map (kbd "s-k") #'prot-simple-kill-buffer-current)))

(prot-emacs-builtin-package 'prot-pulse
  (setq prot-pulse-pulse-command-list
        '(recenter-top-bottom
          reposition-window
          bookmark-jump
          other-window))
  (prot-pulse-advice-commands-mode 1)
  (define-key global-map (kbd "<s-escape>") #'prot-pulse-pulse-line))

(prot-emacs-builtin-package 'cus-edit
;;    Disable the damn thing
    (setq custom-file "~/.emacs.d/custom.el" ;; (make-temp-file "emacs-custom-")
	  )
    )

(prot-emacs-builtin-package 'modus-themes
  ;; Add all your customizations prior to loading the themes
  ;;
  ;; NOTE: these are not my preferences!  I am always testing various
  ;; configurations.  Though I still like what I have here.

  (setq
        modus-themes-bold-constructs nil

        modus-themes-no-mixed-fonts nil
        modus-themes-subtle-line-numbers t
        modus-themes-success-deuteranopia t
        modus-themes-inhibit-reload nil ; only applies to `customize-set-variable' and related

        modus-themes-fringes nil ; {nil,'subtle,'intense}

        ;; Options for `modus-themes-lang-checkers': nil,
        ;; 'straight-underline, 'subtle-foreground,
        ;; 'subtle-foreground-straight-underline, 'intense-foreground,
        ;; 'intense-foreground-straight-underline, 'colored-background
        modus-themes-lang-checkers nil

        ;; Options for `modus-themes-mode-line': nil, '3d, 'moody,
        ;; 'borderless, 'borderless-3d, 'borderless-moody, 'accented,
        ;; 'accented-3d, 'accented-moody, 'borderless-accented,
        ;; 'borderless-accented-3d, 'borderless-accented-moody
        modus-themes-mode-line 'borderless-accented

        ;; Options for `modus-themes-syntax': nil, 'faint,
        ;; 'yellow-comments, 'green-strings,
        ;; 'yellow-comments-green-strings, 'faint,
        ;; 'alt-syntax-yellow-comments, 'faint-yellow-comments
        modus-themes-syntax 'faint
       

        ;; Options for `modus-themes-hl-line': nil, 'intense-background,
        ;; 'accented-background, 'underline-neutral,
        ;; 'underline-accented, 'underline-only-neutral,
        ;; 'underline-only-accented
        modus-themes-hl-line nil

        modus-themes-paren-match 'subtle-bold ; {nil,'subtle-bold,'intense,'intense-bold}

        ;; Options for `modus-themes-links': nil, 'faint,
        ;; 'neutral-underline, 'faint-neutral-underline, 'no-underline,
        ;; 'underline-only, 'neutral-underline-only
        modus-themes-links 'neutral-underline

        ;; Options for `modus-themes-prompts': nil, 'subtle-accented,
        ;; 'intense-accented, 'subtle-gray, 'intense-gray
        modus-themes-prompts nil

        modus-themes-completions nil ; {nil,'moderate,'opinionated}

        modus-themes-mail-citations 'faint ; {nil,'faint,'monochrome}

        ;; Options for `modus-themes-region': nil, 'no-extend, 'bg-only,
        ;; 'bg-only-no-extend, 'accent, 'accent-no-extend
        modus-themes-region nil

        ;; Options for `modus-themes-diffs': nil, 'desaturated,
        ;; 'bg-only, 'deuteranopia, 'fg-only-deuteranopia
        modus-themes-diffs nil

        modus-themes-org-blocks nil ; {nil,'gray-background,'tinted-background} (also read doc string)

        modus-themes-org-agenda ; this is an alist: read the manual or its doc string
        '((header-block . (variable-pitch scale-title))
          (header-date . (grayscale workaholic bold-today))
          (scheduled . uniform)
          (habit . traffic-light-deuteranopia))

        modus-themes-headings ; this is an alist: read the manual or its doc string
        '((1 . rainbow-section)
          (t . rainbow-no-bold))

        modus-themes-variable-pitch-ui nil
        modus-themes-variable-pitch-headings nil
        modus-themes-scale-headings nil
        modus-themes-scale-1 1.1
        modus-themes-scale-2 1.15
        modus-themes-scale-3 1.21
        modus-themes-scale-4 1.27
        modus-themes-scale-title 1.33)
    

  ;; Load the theme files before enabling a theme (else you get an error).
  (modus-themes-load-themes)

  ;; Enable the theme at startup.  This is done after loading the files.
  ;; You only need `modus-themes-load-operandi' for the light theme or
  ;; `modus-themes-load-vivendi' for the dark one.  What I have here is
  ;; a simple test to load a light/dark theme based on some general time
  ;; ranges (just accounting for the hour and without checking for the
  ;; actual sunrise/sunset times).  Plus we have `modus-themes-toggle'
  ;; to switch themes at will.

  (let ((time (string-to-number (format-time-string "%H"))))
    (if (and (> time 5) (< time 18))
        (modus-themes-load-operandi)
      (modus-themes-load-vivendi)))

  (modus-themes-load-vivendi)

   

  ;; Also check my package configurations for `prot-fonts' because I use
  ;; the `modus-themes-after-load-theme-hook' for some typeface-related
  ;; tweaks (as those are made at the "face" level).
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))

(prot-emacs-builtin-package 'prot-fonts
  ;; This is defined in Emacs C code: it belongs to font settings.
  (setq x-underline-at-descent-line t)

  ;; Make sure to read the `prot-fonts-typeface-sets-alist' doc string,
  ;; as it explains what those property lists should contain.
  (setq prot-fonts-typeface-sets-alist  
        '((laptop . ( :fixed-pitch-family "SF Mono"
                      :fixed-pitch-regular-weight regular
                      :fixed-pitch-heavy-weight bold
                      :fixed-pitch-height 120
                      :fixed-pitch-line-spacing 0.1
                      :variable-pitch-family "FiraGO"
                      :variable-pitch-height 1.0
                      :variable-pitch-regular-weight normal))

	  (laptop3 . ( :fixed-pitch-family "SF Mono2"
                      :fixed-pitch-regular-weight medium
                      :fixed-pitch-heavy-weight bold
                      :fixed-pitch-height 130
                      :fixed-pitch-line-spacing 0.2
                      :variable-pitch-family "FiraGO"
                      :variable-pitch-height 1.0
                      :variable-pitch-regular-weight normal))

	  (laptop2 . (:fixed-pitch-family "SF Mono"
                      :fixed-pitch-regular-weight regular
                      :fixed-pitch-heavy-weight bold
                      :fixed-pitch-height 130
                      :fixed-pitch-line-spacing 0.2
                      :variable-pitch-family "FiraGO"
                      :variable-pitch-height 1.0
                      :variable-pitch-regular-weight normal))

          (desktop . ( :fixed-pitch-family "SF Mono2"
                       :fixed-pitch-regular-weight medium
                       :fixed-pitch-heavy-weight bold
                       :fixed-pitch-height 130
                       :fixed-pitch-line-spacing 0.3
                       :variable-pitch-family "FiraGO"
                       :variable-pitch-height nil
                       :variable-pitch-regular-weight normal))

          (presentation . (:fixed-pitch-family "Hack"
                            :fixed-pitch-regular-weight normal
                            :fixed-pitch-heavy-weight bold
                            :fixed-pitch-height 130
                            :fixed-pitch-line-spacing nil
                            :variable-pitch-family "Source Sans Pro"
                            :variable-pitch-height 1.0
                            :variable-pitch-regular-weight normal))))

  ;; The value of `prot-fonts-laptop-desktop-keys-list' becomes '(laptop
  ;; desktop) based on the car of the first two cons cells found in
  ;; `prot-fonts-typeface-sets-alist'.  The assumption is that those
  ;; contain sets from smaller to larger display types.
  (setq prot-fonts-laptop-desktop-keys-list
        (prot-fonts-laptop-desktop-keys))

  ;; This is the breakpoint, in pixels, for determining whether we are
  ;; on the small or large screen layout.  The number here is my
  ;; laptop's screen width, while it expands beyond that when I connect
  ;; it to an external monitor (how I normally set it up on my desk).
  (setq prot-fonts-max-small-resolution-width 1366)

  

  ;; And this just sets the right font depending on whether my laptop is
  ;; connected to an external monitor or not.
  (prot-fonts-fonts-per-monitor)

  (prot-fonts-set-fonts 'laptop)

  ;; See theme section for this hook and also read the doc string of
  ;; `prot-fonts-restore-last'.
  (add-hook 'modus-themes-after-load-theme-hook #'prot-fonts-restore-last)

  (define-key global-map (kbd "C-c f") #'prot-fonts-set-fonts))

(setq-default bidi-paragraph-direction 'left-to-right)
(setq bidi-inhibit-bpa t)

(prot-emacs-builtin-package 'so-long
  (global-so-long-mode 1))

(prot-emacs-builtin-package 'repeat
  (repeat-mode 1))

(prot-emacs-elpa-package 'which-key
  ;; NOTE: I only use this for `embark' and `consult' and for the sake
  ;; of producing more user-friendly video demonstrations.
  (setq which-key-dont-use-unicode t)
  (setq which-key-add-column-padding 2)
  (setq which-key-show-early-on-C-h nil)
  (setq which-key-idle-delay most-positive-fixnum) ; set this to something like 0.8
  (setq which-key-idle-secondary-delay 0.05)
  (setq which-key-popup-type 'side-window)
  (setq which-key-show-prefix 'echo)
  (setq which-key-max-display-columns 3)
  (setq which-key-separator "  ")
  (setq which-key-special-keys nil)
  (setq which-key-paging-key "<next>")
  (which-key-mode +1))	   ; and turn this on, if you want to use this

(prot-emacs-builtin-package 'prot-orderless
  (setq prot-orderless-default-styles
        '(orderless-prefixes
          orderless-strict-leading-initialism
          orderless-regexp))
  (setq prot-orderless-alternative-styles
        '(orderless-literal
          orderless-prefixes
          orderless-strict-leading-initialism
          orderless-regexp)))

(prot-emacs-elpa-package 'orderless
  (setq orderless-component-separator " +")
  (setq orderless-matching-styles prot-orderless-default-styles)
  (setq orderless-style-dispatchers
        '(prot-orderless-literal-dispatcher
          prot-orderless-initialism-dispatcher
          prot-orderless-flex-dispatcher))
  ;; SPC should never complete: use it for `orderless' groups.
  (let ((map minibuffer-local-completion-map))
    (define-key map (kbd "SPC") nil)
    (define-key map (kbd "?") nil)))

(prot-emacs-elpa-package 'marginalia
  (setq marginalia-annotators
        '(marginalia-annotators-heavy
          marginalia-annotators-light))
  (marginalia-mode 1))

(prot-emacs-builtin-package 'minibuffer
  (setq completion-styles
        '(substring initials flex partial-completion orderless))
  (setq completion-category-overrides
        '((file (styles . (partial-completion orderless)))))
  (setq completion-cycle-threshold 2)
  (setq completion-flex-nospace nil)
  (setq completion-pcm-complete-word-inserts-delimiters nil)
  (setq completion-pcm-word-delimiters "-_./:| ")
  (setq completion-show-help nil)
  (setq completion-auto-help t)
  (setq completion-ignore-case t)
  (setq-default case-fold-search t)   ; For general regexp

  ;; The following two are updated in Emacs 28.  They concern the
  ;; *Completions* buffer.
  (setq completions-format 'one-column)
  (setq completions-detailed t)

  ;; Grouping of completions for Emacs 28
  ;;  FIXME 2021-05-21: the group headings break prot-minibuffer cycling
  (setq completions-group nil)
  ;; (setq completions-group-sort 'alphabetical)
  ;; (setq completions-group-format
  ;;       (concat
  ;;        (propertize "    " 'face 'completions-group-separator)
  ;;        (propertize " %s " 'face 'completions-group-title)
  ;;        (propertize " " 'face 'completions-group-separator
  ;;                    'display '(space :align-to right))))

  (setq read-buffer-completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)

  (setq enable-recursive-minibuffers t)
  (setq read-answer-short t) ; also check `use-short-answers' for Emacs28
  (setq resize-mini-windows t)
  (setq minibuffer-eldef-shorten-default t)

  (setq echo-keystrokes 0.25)           ; from the C source code

  (file-name-shadow-mode 1)
  (minibuffer-depth-indicate-mode 1)
  (minibuffer-electric-default-mode 1)

  (add-hook 'completion-list-mode-hook #'prot-common-truncate-lines-silently) ; from `prot-common.el'

  ;; Defines, among others, aliases for common minibuffer commands to
  ;; Super-KEY.  Normally these should go in individual package
  ;; configurations, but their grouping here makes things easier to
  ;; understand.  Besides, they are related to the minibuffer.
  (define-key completion-list-mode-map (kbd "<tab>") #'choose-completion)
  (let ((map global-map))
    (define-key map (kbd "s-b") #'switch-to-buffer)
    (define-key map (kbd "s-B") #'switch-to-buffer-other-window)
    (define-key map (kbd "s-f") #'find-file)
    (define-key map (kbd "s-F") #'find-file-other-window)
    (define-key map (kbd "s-d") #'dired)
    (define-key map (kbd "s-D") #'dired-other-window))
  (let ((map minibuffer-local-completion-map))
    (define-key map (kbd "C-j") #'exit-minibuffer)
    (define-key map (kbd "<tab>") #'minibuffer-force-complete))
  (let ((map minibuffer-local-must-match-map))
    ;; I use this prefix for other searches
    (define-key map (kbd "M-s") nil)))

(prot-emacs-builtin-package 'prot-minibuffer
  (setq-default prot-minibuffer-mini-cursors nil) ; also check `prot-cursor.el'
  (setq prot-minibuffer-remove-shadowed-file-names t)
  (setq prot-minibuffer-minimum-input 3)
  (setq prot-minibuffer-live-update-delay 0.5)

  ;; ;; NOTE: `prot-minibuffer-completion-blocklist' can be used for
  ;; ;; commands with lots of candidates, depending also on how low
  ;; ;; `prot-minibuffer-minimum-input' is.  With my current settings,
  ;; ;; this is not required, otherwise I would use this list:
  ;;
  ;; '( describe-symbol describe-function
  ;;    describe-variable execute-extended-command
  ;;    insert-char)
  (setq prot-minibuffer-completion-blocklist nil)

  ;; This is for commands that should always pop up the completions'
  ;; buffer.  It circumvents the default method of waiting for some user
  ;; input (see `prot-minibuffer-minimum-input') before displaying and
  ;; updating the completions' buffer.
  (setq prot-minibuffer-completion-passlist
        '( dired-goto-file vc-retrieve-tag
           prot-bongo-playlist-insert-playlist-file))

  (define-key global-map (kbd "s-v") #'prot-minibuffer-focus-mini-or-completions)
  (let ((map completion-list-mode-map))
    (define-key map (kbd "h") #'prot-simple-describe-symbol) ; from `prot-simple.el'
    (define-key map (kbd "M-g") #'prot-minibuffer-choose-completion-number)
    (define-key map (kbd "M-v") #'prot-minibuffer-focus-minibuffer)
    (define-key map (kbd "C-g") #'prot-minibuffer-keyboard-quit-dwim)
    (define-key map (kbd "C-n") #'prot-minibuffer-next-completion-or-mini)
    (define-key map (kbd "<down>") #'prot-minibuffer-next-completion-or-mini)
    (define-key map (kbd "C-p") #'prot-minibuffer-previous-completion-or-mini)
    (define-key map (kbd "<up>") #'prot-minibuffer-previous-completion-or-mini)
    (define-key map (kbd "<return>") #'prot-minibuffer-choose-completion-exit)
    (define-key map (kbd "<M-return>") #'prot-minibuffer-choose-completion-dwim)
    (define-key map (kbd "M-<") #'prot-minibuffer-beginning-of-buffer)
    ;; Those are generic actions for the "*Completions*" buffer, though
    ;; I normally use `embark'.
    (define-key map (kbd "w") #'prot-minibuffer-completions-kill-symbol-at-point)
    (define-key map (kbd "i") #'prot-minibuffer-completions-insert-symbol-at-point)
    (define-key map (kbd "j") #'prot-minibuffer-completions-insert-symbol-at-point-exit))
  (let ((map minibuffer-local-completion-map))
    (define-key map (kbd "M-g") #'prot-minibuffer-choose-completion-number)
    (define-key map (kbd "C-n") #'prot-minibuffer-switch-to-completions-top)
    (define-key map (kbd "<down>") #'prot-minibuffer-switch-to-completions-top)
    (define-key map (kbd "C-p") #'prot-minibuffer-switch-to-completions-bottom)
    (define-key map (kbd "<up>") #'prot-minibuffer-switch-to-completions-bottom)
    (define-key map (kbd "C-l") #'prot-minibuffer-toggle-completions)) ; "list" mnemonic
  (let ((map minibuffer-local-filename-completion-map))
    (define-key map (kbd "<M-backspace>") #'prot-minibuffer-backward-updir))
  (add-hook 'minibuffer-setup-hook #'prot-minibuffer-mini-cursor)
  (add-hook 'completion-list-mode-hook #'prot-minibuffer-completions-cursor)
  (add-hook 'completion-list-mode-hook #'prot-minibuffer-hl-line)
  (add-hook 'completion-list-mode-hook #'prot-minibuffer-display-line-numbers))

(prot-emacs-elpa-package 'consult
  (setq consult-line-numbers-widen t)
  ;; ;; FIXME 2021-04-10: This does not work with `prot-minibuffer.el'.
  ;; (setq completion-in-region-function #'consult-completion-in-region)
  (setq consult-async-min-input 3)
  (setq consult-async-input-debounce 0.5)
  (setq consult-async-input-throttle 0.8)
  (setq consult-narrow-key ">")
  (setq consult-imenu-config
        '((emacs-lisp-mode :toplevel "Functions"
                           :types ((?f "Functions" font-lock-function-name-face)
                                   (?m "Macros"    font-lock-keyword-face)
                                   (?p "Packages"  font-lock-constant-face)
                                   (?t "Types"     font-lock-type-face)
                                   (?v "Variables" font-lock-variable-name-face)))))
  (setq register-preview-delay 0.8
        register-preview-function #'consult-register-format)
  (setq consult-find-command "find . -iname *ARG* OPTS")
  (setq consult-preview-key 'any)

  ;; Enables previews inside the standard *Completions* buffer (what
  ;; `prot-minibuffer.el' uses).
  (add-hook 'completion-list-mode-hook #'consult-preview-at-point-mode)

  (let ((map global-map))
    (define-key map (kbd "C-x M-:") #'consult-complex-command)
    (define-key map (kbd "C-x M-m") #'consult-minor-mode-menu)
    (define-key map (kbd "C-x M-k") #'consult-kmacro)
    (define-key map (kbd "M-g M-g") #'consult-goto-line)
    (define-key map (kbd "M-K") #'consult-keep-lines) ; M-S-k is similar to M-S-5 (M-%)
    (define-key map (kbd "M-F") #'consult-focus-lines) ; same principle
    (define-key map (kbd "M-s M-b") #'consult-buffer)
    (define-key map (kbd "M-s M-f") #'consult-find)
    (define-key map (kbd "M-s M-g") #'consult-grep)
    (define-key map (kbd "M-s M-m") #'consult-mark)
    (define-key map (kbd "C-x r r") #'consult-register)) ; Use the register's prefix
  (define-key consult-narrow-map (kbd "?") #'consult-narrow-help))

(prot-emacs-builtin-package 'prot-consult
  (setq consult-project-root-function #'prot-consult-project-root)
  (setq prot-consult-command-centre-list
        '(consult-line
          prot-consult-line
          consult-mark))
  (setq prot-consult-command-top-list
        '(consult-outline
          consult-imenu
          prot-consult-outline
          prot-consult-imenu))
  (prot-consult-set-up-hooks-mode 1)
  (let ((map global-map))
    (define-key map (kbd "M-s M-i") #'prot-consult-imenu)
    (define-key map (kbd "M-s M-s") #'prot-consult-outline)
    (define-key map (kbd "M-s M-y") #'prot-consult-yank)
    (define-key map (kbd "M-s M-l") #'prot-consult-line)))

(prot-emacs-elpa-package 'embark
  (setq embark-collect-initial-view-alist
        '((file . list)
          (buffer . list)
          (symbol . list)
          (line . list)
          (xref-location . list)
          (kill-ring . zebra)
          (t . list)))
  (setq embark-quit-after-action t)     ; XXX: Read the doc string!
  (setq embark-collect-live-update-delay 0.5)
  (setq embark-collect-live-initial-delay 0.8)

  (define-key global-map (kbd "C-,") #'embark-act)
  (let ((map minibuffer-local-completion-map))
    (define-key map (kbd "C-,") #'embark-act)
    (define-key map (kbd "C->") #'embark-become)
    (define-key map (kbd "M-q") #'embark-collect-toggle-view)) ; parallel of `fill-paragraph'
  (let ((map embark-collect-mode-map))
    (define-key map (kbd "C-,") #'embark-act)
    (define-key map (kbd ",") #'embark-act)
    (define-key map (kbd "M-q") #'embark-collect-toggle-view))
  (let ((map embark-region-map))
    (define-key map (kbd "a") #'align-regexp)
    (define-key map (kbd "i") #'epa-import-keys-region)
    (define-key map (kbd "s") #'sort-lines)
    (define-key map (kbd "u") #'untabify))
  (let ((map embark-symbol-map))
    (define-key map (kbd ".") #'embark-find-definition)
    (define-key map (kbd "k") #'describe-keymap)))

(prot-emacs-builtin-package 'prot-embark
  (prot-embark-keymaps 1)
  (prot-embark-setup-packages 1))

(prot-emacs-builtin-package 'project
  ;; ;; Use this for Emacs 27 (I am on 28)
  ;; (add-to-list 'prot-emacs-ensure-install 'project)
  (setq project-switch-commands
        '((?f "File" project-find-file)
          (?s "Subdir" prot-project-find-subdir)
          (?g "Grep" project-find-regexp)
          (?d "Dired" project-dired)
          (?b "Buffer" project-switch-to-buffer)
          (?q "Query replace" project-query-replace-regexp)
          (?t "Tag switch" prot-project-retrieve-tag)
          (?m "Magit" prot-project-magit-status)
          (?v "VC dir" project-vc-dir)
          (?l "Log VC" prot-project-commit-log)
          (?e "Eshell" project-eshell)))
  (define-key global-map (kbd "C-x p q") #'project-query-replace-regexp)) ; C-x p is `project-prefix-map'

(prot-emacs-builtin-package 'prot-project
  (setq prot-project-project-roots '("~/Git/Projects/" "~/Git/build/"))
  (setq prot-project-commit-log-limit 25)
  (setq prot-project-large-file-lines 1000)
  (let ((map global-map))
    (define-key map (kbd "C-x p <delete>") #'prot-project-remove-project)
    (define-key map (kbd "C-x p l") #'prot-project-commit-log)
    (define-key map (kbd "C-x p m") #'prot-project-magit-status)
    (define-key map (kbd "C-x p s") #'prot-project-find-subdir)
    (define-key map (kbd "C-x p t") #'prot-project-retrieve-tag)))

;; Project repo: <https://github.com/karthink/project-x>.  This is one
;; of the packages I handle manually via git, at least until it becomes
;; available through an ELPA.
;;
;; `prot-emacs-manual-package' is defined in my init.el
(prot-emacs-manual-package 'project-x
  (setq project-x-window-list-file (locate-user-emacs-file "project-x-window-list"))
  (setq project-x-local-identifier ".project")
  (project-x-mode 1))

(prot-emacs-builtin-package 'recentf
  (setq recentf-save-file (locate-user-emacs-file "recentf"))
  (setq recentf-max-saved-items 200)
  (setq recentf-exclude '(".gz" ".xz" ".zip" "/elpa/" "/ssh:" "/sudo:"))
  (add-hook 'after-init-hook #'recentf-mode))

(prot-emacs-builtin-package 'prot-recentf
  (add-to-list 'recentf-keep 'prot-recentf-keep-predicate)
  (let ((map global-map))
    (define-key map (kbd "s-r") #'prot-recentf-recent-files)
    (define-key map (kbd "C-x C-r") #'prot-recentf-recent-dirs)))

;; (prot-emacs-elpa-package 'corfu
  ;;   (dolist (mode '( message-mode-hook text-mode-hook prog-mode-hook
  ;; 		     shell-mode-hook eshell-mode-hook))
  ;;     (add-hook mode #'corfu-mode))
  ;;   (define-key corfu-map (kbd "<tab>") #'corfu-complete))


(load "corfu")
  (dolist (mode '( message-mode-hook text-mode-hook prog-mode-hook
		   shell-mode-hook eshell-mode-hook))
    (add-hook mode #'corfu-mode))
  (define-key corfu-map (kbd "<tab>") #'corfu-complete)

(prot-emacs-builtin-package 'dabbrev
  (setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_")
  (setq dabbrev-abbrev-skip-leading-regexp "[$*/=~']")
  (setq dabbrev-backward-only nil)
  (setq dabbrev-case-distinction 'case-replace)
  (setq dabbrev-case-fold-search nil)
  (setq dabbrev-case-replace 'case-replace)
  (setq dabbrev-check-other-buffers t)
  (setq dabbrev-eliminate-newlines t)
  (setq dabbrev-upcase-means-case-search t)
  (let ((map global-map))
    (define-key map (kbd "M-/") #'dabbrev-expand)
    (define-key map (kbd "s-/") #'dabbrev-completion)))

(prot-emacs-builtin-package 'abbrev
  (setq abbrev-file-name (locate-user-emacs-file "abbrevs"))
  (setq only-global-abbrevs nil)

  ;;;;;;;;;;;;;;;;;;;;;;
  ;; simple skeletons ;;
  ;;;;;;;;;;;;;;;;;;;;;;
  (define-skeleton protesilaos-com-skeleton
    "Adds a link to my website while prompting for a possible
  extension."
    "Insert website extension: "
    "https://protesilaos.com/" str "")
  (define-abbrev global-abbrev-table "meweb"
    "" 'protesilaos-com-skeleton)

  (define-skeleton protesilaos-gitlab-skeleton
    "Adds a link to my GitLab account while prompting for a
  possible extension.  Makes it easy to link to my various git
  repos."
    "Website extension: "
    "https://gitlab.com/protesilaos/" str "")
  (define-abbrev global-abbrev-table "megit"
    "" 'protesilaos-gitlab-skeleton)

  (let ((map global-map))
    (define-key map (kbd "C-x a e") #'expand-abbrev) ; default, just here for visibility
    (define-key map (kbd "C-x a u") #'unexpand-abbrev))
  (add-hook 'text-mode-hook #'abbrev-mode)
  (add-hook 'git-commit-mode-hook #'abbrev-mode))

(prot-emacs-builtin-package 'isearch
  (setq search-highlight t)
  (setq search-whitespace-regexp ".*?")
  (setq isearch-lax-whitespace t)
  (setq isearch-regexp-lax-whitespace nil)
  (setq isearch-lazy-highlight t)
  ;; All of the following variables were introduced in Emacs 27.1.
  (setq isearch-lazy-count t)
  (setq lazy-count-prefix-format nil)
  (setq lazy-count-suffix-format " (%s/%s)")
  (setq isearch-yank-on-move 'shift)
  (setq isearch-allow-scroll 'unlimited)
  (define-key minibuffer-local-isearch-map (kbd "M-/") #'isearch-complete-edit)
  (let ((map isearch-mode-map))
    (define-key map (kbd "C-g") #'isearch-cancel) ; instead of `isearch-abort'
    (define-key map (kbd "M-/") #'isearch-complete)))

(prot-emacs-builtin-package 'replace
  (setq list-matching-lines-jump-to-current-line t)
  (add-hook 'occur-mode-hook #'hl-line-mode)
  (add-hook 'occur-mode-hook #'prot-common-truncate-lines-silently) ; from `prot-common.el'
  (define-key global-map (kbd "M-s M-o") #'multi-occur)
  (define-key occur-mode-map (kbd "t") #'toggle-truncate-lines))

(prot-emacs-builtin-package 'grep)

(prot-emacs-builtin-package 'prot-search
  (let ((map global-map))
    (define-key map (kbd "M-s %") #'prot-search-isearch-replace-symbol)
    (define-key map (kbd "M-s M-<") #'prot-search-isearch-beginning-of-buffer)
    (define-key map (kbd "M-s M->") #'prot-search-isearch-end-of-buffer)
    (define-key map (kbd "M-s g") #'prot-search-grep)
    (define-key map (kbd "M-s u") #'prot-search-occur-urls)
    (define-key map (kbd "M-s M-u") #'prot-search-occur-browse-url))
  (let ((map isearch-mode-map))
    (define-key map (kbd "<up>") #'prot-search-isearch-repeat-backward)
    (define-key map (kbd "<down>") #'prot-search-isearch-repeat-forward)
    (define-key map (kbd "<backspace>") #'prot-search-isearch-abort-dwim)
    (define-key map (kbd "<C-return>") #'prot-search-isearch-other-end)))

(prot-emacs-builtin-package 're-builder
  (setq reb-re-syntax 'read))

(prot-emacs-elpa-package 'wgrep
  (setq wgrep-auto-save-buffer t)
  (setq wgrep-change-readonly-file t)
  (let ((map grep-mode-map))
    (define-key map (kbd "e") #'wgrep-change-to-wgrep-mode)
    (define-key map (kbd "C-x C-q") #'wgrep-change-to-wgrep-mode)
    (define-key map (kbd "C-c C-c") #'wgrep-finish-edit)))

(prot-emacs-builtin-package 'xref
  ;; All those have been changed for Emacs 28
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read) ; for M-.
  (setq xref-show-xrefs-function #'xref-show-definitions-buffer) ; for grep and the like
  (setq xref-file-name-display 'project-relative)
  (setq xref-search-program 'grep))

(prot-emacs-builtin-package 'dired
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
   ;; (setq dired-listing-switches
   ;;      "-AGFhlv  --time-style=long-iso")
  (setq dired-dwim-target t)
  (setq dired-auto-revert-buffer #'dired-directory-changed-p) ; also see `dired-do-revert-buffer'

  (add-hook 'dired-mode-hook #'dired-hide-details-mode)
  (add-hook 'dired-mode-hook #'hl-line-mode))

(prot-emacs-builtin-package 'dired-aux
  (setq dired-isearch-filenames 'dwim)
  ;; The following variables were introduced in Emacs 27.1
  (setq dired-create-destination-dirs 'ask)
  (setq dired-vc-rename-file t)
  ;; And this is for Emacs 28
  (setq dired-do-revert-buffer (lambda (dir) (not (file-remote-p dir))))

  ;; Those two functions are copied from the Emacs config of Omar
  ;; Antolín Camarena: <https://github.com/oantolin/emacs-config>.
  (defun contrib/cdb--bookmarked-directories ()
    (bookmark-maybe-load-default-file)
    (cl-loop for (name . props) in bookmark-alist
	     for fn = (cdr (assq 'filename props))
	     when (and fn (string-suffix-p "/" fn))
	     collect (cons name fn)))

  (defun contrib/cd-bookmark (bm)
    "Insert the path of a bookmarked directory."
    (interactive
     (list (let ((enable-recursive-minibuffers t))
	     (completing-read
	      "Directory: " (contrib/cdb--bookmarked-directories) nil t))))
    (when (minibufferp)
      (delete-region (minibuffer-prompt-end) (point-max)))
    (insert (cdr (assoc bm (contrib/cdb--bookmarked-directories)))))

  (let ((map dired-mode-map))
    (define-key map (kbd "C-+") #'dired-create-empty-file)
    (define-key map (kbd "M-s f") #'nil)
    (define-key map (kbd "C-x v v") #'dired-vc-next-action)) ; Emacs 28
  (define-key minibuffer-local-filename-completion-map (kbd "C-c d") #'contrib/cd-bookmark))

;; ;; NOTE 2021-05-10: I do not use `find-dired' and related commands
;; ;; because there are other tools that offer a better interface, such
;; ;; as `consult-find', `consult-grep', `project-find-file',
;; ;; `project-find-regexp', `prot-vc-git-grep'.
;; (prot-emacs-builtin-package 'find-dired
;;   (setq find-ls-option
;;         '("-ls" . "-AGFhlv --group-directories-first --time-style=long-iso"))
;;   (setq find-name-arg "-iname"))

(prot-emacs-builtin-package 'prot-dired
 (let ((map dired-mode-map))
   (define-key map (kbd "M-n") #'prot-dired-subdirectory-next)
   (define-key map (kbd "C-c C-n") #'prot-dired-subdirectory-next)
   (define-key map (kbd "M-p") #'prot-dired-subdirectory-previous)
   (define-key map (kbd "C-c C-p") #'prot-dired-subdirectory-next)))

(prot-emacs-builtin-package 'dired-x
  (setq dired-clean-up-buffers-too t)
  (setq dired-clean-confirm-killing-deleted-buffers t)
  (setq dired-x-hands-off-my-keys t)    ; easier to show the keys I use
  (setq dired-bind-man nil)
  (setq dired-bind-info nil)
  (let ((map global-map))
    (define-key map (kbd "C-x C-j") #'dired-jump)
    (define-key map (kbd "s-j") #'dired-jump)
    (define-key map (kbd "C-x 4 C-j") #'dired-jump-other-window)
    (define-key map (kbd "s-J") #'dired-jump-other-window))
  (define-key dired-mode-map (kbd "I") #'dired-info))

(prot-emacs-elpa-package 'dired-subtree
  (setq dired-subtree-use-backgrounds nil)
  (let ((map dired-mode-map))
    (define-key map (kbd "<tab>") #'dired-subtree-toggle)
    (define-key map (kbd "<C-tab>") #'dired-subtree-cycle)
    (define-key map (kbd "<backtab>") #'dired-subtree-remove))) ; S-TAB

(prot-emacs-builtin-package 'wdired
  (setq wdired-allow-to-change-permissions t)
  (setq wdired-create-parent-directories t))

(prot-emacs-builtin-package 'image-dired
  (setq image-dired-external-viewer "xdg-open")
  (setq image-dired-thumb-size 80)
  (setq image-dired-thumb-margin 2)
  (setq image-dired-thumb-relief 0)
  (setq image-dired-thumbs-per-row 4)
  (define-key image-dired-thumbnail-mode-map
    (kbd "<return>") #'image-dired-thumbnail-display-external))

(prot-emacs-elpa-package 'trashed
  (setq trashed-action-confirmer 'y-or-n-p)
  (setq trashed-use-header-line t)
  (setq trashed-sort-key '("Date deleted" . t))
  (setq trashed-date-format "%Y-%m-%d %H:%M:%S"))

(let ((map ctl-x-x-map))              ; Emacs 28
  (define-key map "e" #'eval-buffer)
  (define-key map "f" #'follow-mode)  ; override `font-lock-update'
  (define-key map "r" #'rename-uniquely))

(with-eval-after-load 'org
  (define-key ctl-x-x-map "i" #'contrib/org-id-headlines)
  (define-key ctl-x-x-map "h" #'prot/ox-html))

(prot-emacs-builtin-package 'uniquify
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-strip-common-suffix t)
  (setq uniquify-after-kill-buffer-p t))

(prot-emacs-builtin-package 'ibuffer
  (setq ibuffer-expert t)
  (setq ibuffer-display-summary nil)
  (setq ibuffer-use-other-window nil)
  (setq ibuffer-show-empty-filter-groups nil)
  (setq ibuffer-movement-cycle nil)
  (setq ibuffer-default-sorting-mode 'filename/process)
  (setq ibuffer-use-header-line t)
  (setq ibuffer-default-shrink-to-minimum-size nil)
  (setq ibuffer-formats
        '((mark modified read-only locked " "
                (name 40 40 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " " filename-and-process)
          (mark " "
                (name 16 -1)
                " " filename)))
  (setq ibuffer-saved-filter-groups nil)
  (setq ibuffer-old-time 48)
  (add-hook 'ibuffer-mode-hook #'hl-line-mode)
  (define-key global-map (kbd "C-x C-b") #'ibuffer)
  (let ((map ibuffer-mode-map))
    (define-key map (kbd "* f") #'ibuffer-mark-by-file-name-regexp)
    (define-key map (kbd "* g") #'ibuffer-mark-by-content-regexp) ; "g" is for "grep"
    (define-key map (kbd "* n") #'ibuffer-mark-by-name-regexp)
    (define-key map (kbd "s n") #'ibuffer-do-sort-by-alphabetic)  ; "sort name" mnemonic
    (define-key map (kbd "/ g") #'ibuffer-filter-by-content)))

(prot-emacs-builtin-package 'prot-ibuffer
  (let ((map global-map))
    (define-key map (kbd "M-s b") #'prot-ibuffer-buffers-major-mode)
    (define-key map (kbd "M-s v") #'prot-ibuffer-buffers-vc-root)))

(prot-emacs-elpa-package 'scratch
  ;; TODO 2021-01-19: refine `prot/scratch-buffer-setup'
  (defun prot/scratch-buffer-setup ()
    "Add contents to `scratch' buffer and name it accordingly.
If region is active, add its contents to the new buffer."
    (let* ((mode major-mode)
           (string (format "Scratch buffer for: %s\n\n" mode))
           (region (with-current-buffer (current-buffer)
                     (if (region-active-p)
                         (buffer-substring-no-properties
                          (region-beginning)
                          (region-end)))
                     ""))
           (text (concat string region)))
      (when scratch-buffer
	    (save-excursion
          (insert text)
          (goto-char (point-min))
          (comment-region (point-at-bol) (point-at-eol)))
	    (forward-line 2))
      (rename-buffer (format "*Scratch for %s*" mode) t)))
  (add-hook 'scratch-create-buffer-hook #'prot/scratch-buffer-setup)
  (define-key global-map (kbd "C-c s") #'scratch))

(prot-emacs-builtin-package 'window
  (setq display-buffer-alist
        `(;; top side window
          ("\\**prot-elfeed-bongo-queue.*"
           (display-buffer-reuse-window display-buffer-in-side-window)
           (window-height . 0.16)
           (side . top)
           (slot . -2))
          ("\\*\\(prot-elfeed-mpv-output\\|world-clock\\).*"
           (display-buffer-in-side-window)
           (window-height . 0.16)
           (side . top)
           (slot . -1))
          ("\\*\\(Flymake\\|Package-Lint\\|vc-git :\\).*"
           (display-buffer-in-side-window)
           (window-height . 0.16)
           (side . top)
           (slot . 0))
          ("\\*Messages.*"
           (display-buffer-in-side-window)
           (window-height . 0.16)
           (side . top)
           (slot . 1))
          ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\)\\*"
           (display-buffer-in-side-window)
           (window-height . 0.16)
           (side . top)
           (slot . 2)
           (window-parameters . ((no-other-window . t))))
          ;; bottom side window
          ("\\*\\(Embark\\)?.*Completions.*"
           (display-buffer-in-side-window)
           (side . bottom)
           (slot . 0)
           (window-parameters . ((no-other-window . t)
                                 (mode-line-format . none))))
          ;; left side window
          ("\\*Help.*"
           (display-buffer-in-side-window)
           (window-width . 0.20)       ; See the :hook
           (side . left)
           (slot . 0))
          ;; right side window
          ("\\*keycast\\*"
           (display-buffer-in-side-window)
           (dedicated . t)
           (window-width . 0.25)
           (side . right)
           (slot . -1)
           (window-parameters . ((no-other-window . t)
                                 (mode-line-format . none))))
          ("\\*Faces\\*"
           (display-buffer-in-side-window)
           (window-width . 0.25)
           (side . right)
           (slot . 0))
          ("\\*Custom.*"
           (display-buffer-in-side-window)
           (window-width . 0.25)
           (side . right)
           (slot . 1))
          ;; bottom buffer (NOT side window)
          ("\\*\\vc-\\(incoming\\|outgoing\\).*"
           (display-buffer-at-bottom))
          ("\\*\\(Output\\|Register Preview\\).*"
           (display-buffer-at-bottom))
          ("\\*.*\\(e?shell\\|v?term\\).*"
           (display-buffer-reuse-mode-window display-buffer-at-bottom)
           (window-height . 0.2))
          ;; below currect window
          ("\\*Calendar.*"
           (display-buffer-reuse-mode-window display-buffer-below-selected)
           (window-height . shrink-window-if-larger-than-buffer))))
  (setq window-combination-resize t)
  (setq even-window-sizes 'height-only)
  (setq window-sides-vertical nil)
  (setq switch-to-buffer-in-dedicated-window 'pop)
  (add-hook 'help-mode-hook #'visual-line-mode)
  (add-hook 'custom-mode-hook #'visual-line-mode)
  (let ((map global-map))
    (define-key map (kbd "s-n") #'next-buffer)
    (define-key map (kbd "s-p") #'previous-buffer)
    (define-key map (kbd "s-o") #'other-window)
    (define-key map (kbd "s-2") #'split-window-below)
    (define-key map (kbd "s-3") #'split-window-right)
    (define-key map (kbd "s-0") #'delete-window)
    (define-key map (kbd "s-1") #'delete-other-windows)
    (define-key map (kbd "s-!") #'delete-other-windows-vertically) ; s-S-1
    (define-key map (kbd "s-5") #'delete-frame)
    (define-key map (kbd "C-x _") #'balance-windows)      ; underscore
    (define-key map (kbd "C-x -") #'fit-window-to-buffer) ; hyphen
    (define-key map (kbd "C-x +") #'balance-windows-area)
    (define-key map (kbd "s-q") #'window-toggle-side-windows)
    (define-key map (kbd "C-x }") #'enlarge-window)
    (define-key map (kbd "C-x {") #'shrink-window)
    (define-key map (kbd "C-x >") #'enlarge-window-horizontally) ; override `scroll-right'
    (define-key map (kbd "C-x <") #'shrink-window-horizontally)) ; override `scroll-left'
  (let ((map resize-window-repeat-map))
    (define-key map ">" #'enlarge-window-horizontally)
    (define-key map "<" #'shrink-window-horizontally)))

(prot-emacs-builtin-package 'winner
  (add-hook 'after-init-hook #'winner-mode)
  (let ((map global-map))
    (define-key map (kbd "<M-s-right>") #'winner-redo)
    (define-key map (kbd "<M-s-left>") #'winner-undo)))

(prot-emacs-builtin-package 'windmove
  (setq windmove-create-window nil)     ; Emacs 27.1
  (let ((map global-map))
    (define-key map (kbd "<s-up>") #'windmove-up)
    (define-key map (kbd "<s-right>") #'windmove-right)
    (define-key map (kbd "<s-down>") #'windmove-down)
    (define-key map (kbd "<s-left>") #'windmove-left)
    (define-key map (kbd "<S-s-up>") #'windmove-swap-states-up)
    (define-key map (kbd "<S-s-right>") #'windmove-swap-states-right)
    (define-key map (kbd "<S-s-down>") #'windmove-swap-states-down)
    (define-key map (kbd "<S-s-left>") #'windmove-swap-states-left)))

(prot-emacs-builtin-package 'tab-bar
  (setq tab-bar-close-button-show nil)
  (setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
  (setq tab-bar-close-tab-select 'recent)
  (setq tab-bar-new-tab-choice t)
  (setq tab-bar-new-tab-to 'right)
  (setq tab-bar-position nil)
  (setq tab-bar-show nil)
  (setq tab-bar-tab-hints nil)
  (setq tab-bar-tab-name-function 'tab-bar-tab-name-current)
  (setq tab-bar-format                  ; Emacs 28
        '(tab-bar-format-tabs
          tab-bar-separator
          tab-bar-format-align-right
          tab-bar-format-global))
  (tab-bar-mode -1)
  (tab-bar-history-mode -1)
  (let ((map global-map))
    (define-key map (kbd "<s-tab>") #'tab-next)
    (define-key map (kbd "<s-backtab>") #'tab-previous))) ; S-s-TAB

(prot-emacs-builtin-package 'prot-tab
  (let ((map global-map))
    (define-key map (kbd "<f8>") #'prot-tab-tab-bar-toggle)
    (define-key map (kbd "C-x t t") #'prot-tab-select-tab-dwim)
    (define-key map (kbd "s-t") #'prot-tab-select-tab-dwim)))

;; ;; This is only included as a reference.
;; (prot-emacs-builtin-package 'tab-line
;;   (global-tab-line-mode -1))

(prot-emacs-elpa-package 'tab-bar-echo-area
  (tab-bar-echo-area-mode 1))

(prot-emacs-elpa-package 'tab-bar-groups
  (tab-bar-groups-activate)

  (let ((map tab-prefix-map))           ; the prefix is C-x t
    (define-key map (kbd "g 0") #'tab-bar-groups-close-group)
    (define-key map (kbd "g 2") #'tab-bar-groups-new-tab)
    (define-key map (kbd "g a") #'tab-bar-groups-assign-group)
    (define-key map (kbd "g g") #'tab-bar-groups-regroup-tabs)
    (define-key map (kbd "g d") #'tab-bar-groups-duplicate-tab)
    (define-key map (kbd "g e") #'tab-bar-groups-eject-tab)
    (define-key map (kbd "g r") #'tab-bar-groups-rename-group)))

(prot-emacs-elpa-package 'transpose-frame
  (let ((map global-map))
    (define-key map (kbd "C-s-t") #'flop-frame) ; what I consider "transpose" in this context
    (define-key map (kbd "C-s-r") #'rotate-frame-clockwise)))

(prot-emacs-builtin-package 'face-remap)

(prot-emacs-elpa-package 'olivetti
  (setq olivetti-body-width 0.7)
  (setq olivetti-minimum-body-width 80)
  (setq olivetti-recall-visual-line-mode-entry-state t))

(prot-emacs-elpa-package 'org-tree-slide
  (setq org-tree-slide-breadcrumbs nil)
  (setq org-tree-slide-header nil)
  (setq org-tree-slide-slide-in-effect nil)
  (setq org-tree-slide-heading-emphasis nil)
  (setq org-tree-slide-cursor-init t)
  (setq org-tree-slide-modeline-display nil)
  (setq org-tree-slide-skip-done nil)
  (setq org-tree-slide-skip-comments t)
  (setq org-tree-slide-fold-subtrees-skipped t)
  (setq org-tree-slide-skip-outline-level 8)
  (setq org-tree-slide-never-touch-face t)
  (setq org-tree-slide-activate-message
        (format "Presentation %s" (propertize "ON" 'face 'success)))
  (setq org-tree-slide-deactivate-message
        (format "Presentation %s" (propertize "OFF" 'face 'error)))
  (let ((map org-tree-slide-mode-map))
    (define-key map (kbd "<C-down>") #'org-tree-slide-display-header-toggle)
    (define-key map (kbd "<C-right>") #'org-tree-slide-move-next-tree)
    (define-key map (kbd "<C-left>") #'org-tree-slide-move-previous-tree)))

(prot-emacs-builtin-package 'prot-logos
  (setq prot-logos-org-presentation nil)
  (setq prot-logos-variable-pitch nil)
  (setq prot-logos-scroll-lock nil)
  (setq prot-logos-hidden-modeline t)
  (define-key global-map (kbd "<f9>") #'prot-logos-focus-mode))

(prot-emacs-builtin-package 'usls
  (setq usls-directory (expand-file-name "~/Documents/notes/"))
  (setq usls-known-categories '("economics" "philosophy" "politics"))
  (setq usls-file-type-extension ".txt") ; {.txt,.org,.md}
  (setq usls-subdir-support nil)
  (setq usls-file-region-separator 'line) ; {'line,'heading, OR string of your choice}
  (setq usls-file-region-separator-heading-level 1)
  (setq usls-custom-header-function nil)

  (add-hook 'usls-mode-hook #'goto-address-mode)

  (let ((map global-map))               ; globally bound keys
    (define-key map (kbd "C-c n d") #'usls-dired)
    (define-key map (kbd "C-c n f") #'usls-find-file)
    (define-key map (kbd "C-c n a") #'usls-append-region-buffer-or-file)
    (define-key map (kbd "C-c n n") #'usls-new-note))
  (let ((map usls-mode-map))            ; only for usls buffers
    (define-key map (kbd "C-c n i") #'usls-id-insert)
    (define-key map (kbd "C-c n l") #'usls-follow-link)))

(prot-emacs-builtin-package 'tmr
  (setq tmr-sound-file
        "/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"))

(prot-emacs-builtin-package 'diff-mode
  (setq diff-default-read-only t)
  (setq diff-advance-after-apply-hunk t)
  (setq diff-update-on-the-fly t)
  ;; The following are from Emacs 27.1
  (setq diff-refine nil)                ; I do it on demand
  (setq diff-font-lock-prettify nil)    ; better for patches
  ;; The following is further controlled by
  ;; `prot-diff-modus-themes-diffs'
  (setq diff-font-lock-syntax 'hunk-also))

(prot-emacs-builtin-package 'prot-diff
  (prot-diff-modus-themes-diffs)
  (add-hook 'modus-themes-after-load-theme-hook #'prot-diff-modus-themes-diffs)

  (prot-diff-extra-keywords 1)

  ;; `prot-diff-buffer-dwim' replaces the default for `vc-diff' (which I
  ;; bind to another key---see VC section).
  (define-key global-map (kbd "C-x v =") #'prot-diff-buffer-dwim)
  (let ((map diff-mode-map))
    (define-key map (kbd "C-c C-b") #'prot-diff-refine-cycle) ; replace `diff-refine-hunk'
    (define-key map (kbd "C-c C-n") #'prot-diff-narrow-dwim)))

(prot-emacs-builtin-package 'vc
  ;; Those offer various types of functionality, such as blaming,
  ;; viewing logs, showing a dedicated buffer with changes to affected
  ;; files.
  (require 'vc-annotate)
  (require 'vc-dir)
  (require 'vc-git)
  (require 'add-log)
  (require 'log-view)

  ;; This one is for editing commit messages.
  (require 'log-edit)
  (setq log-edit-confirm 'changed)
  (setq log-edit-keep-buffer nil)
  (setq log-edit-require-final-newline t)
  (setq log-edit-setup-add-author nil)

  ;; Note that `prot-vc-git-setup-mode' will run the following when
  ;; activated:
  ;;
  ;;   (remove-hook 'log-edit-hook #'log-edit-show-files)
  ;;
  ;; If you need the window to pop back up, do it manually with C-c C-f
  ;; which calls `log-edit-show-files'.

  (setq vc-find-revision-no-save t)
  (setq vc-annotate-display-mode 'scale) ; scale to oldest
  ;; I use a different account for git commits
  (setq add-log-mailing-address "info@protesilaos.com")
  (setq add-log-keep-changes-together t)
  (setq vc-git-diff-switches '("--patch-with-stat" "--histogram"))
  (setq vc-git-print-log-follow t)
  (setq vc-git-revision-complete-only-branches nil) ; Emacs 28
  (setq vc-git-root-log-format
        '("%d %h %ad %an: %s"
          ;; The first shy group matches the characters drawn by --graph.
          ;; We use numbered groups because `log-view-message-re' wants the
          ;; revision number to be group 1.
          "^\\(?:[*/\\|]+\\)\\(?:[*/\\| ]+\\)?\
\\(?2: ([^)]+) \\)?\\(?1:[0-9a-z]+\\) \
\\(?4:[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}\\) \
\\(?3:.*?\\):"
          ((1 'log-view-message)
           (2 'change-log-list nil lax)
           (3 'change-log-name)
           (4 'change-log-date))))

  ;; NOTE: I override lots of the defaults
  (let ((map global-map))
    (define-key map (kbd "C-x v a") #'vc-annotate) ; `vc-update-change-log' is not in git
    (define-key map (kbd "C-x v b") #'vc-retrieve-tag)  ; "branch" switch
    (define-key map (kbd "C-x v t") #'vc-create-tag)
    (define-key map (kbd "C-x v f") #'vc-log-incoming)  ; the actual git fetch
    (define-key map (kbd "C-x v o") #'vc-log-outgoing)
    (define-key map (kbd "C-x v F") #'vc-update)        ; "F" because "P" is push
    (define-key map (kbd "C-x v d") #'vc-diff))
  (let ((map vc-dir-mode-map))
    (define-key map (kbd "a") #'vc-annotate)
    (define-key map (kbd "b") #'vc-retrieve-tag)
    (define-key map (kbd "t") #'vc-create-tag)
    (define-key map (kbd "O") #'vc-log-outgoing)
    (define-key map (kbd "o") #'vc-dir-find-file-other-window)
    (define-key map (kbd "f") #'vc-log-incoming) ; replaces `vc-dir-find-file' (use RET)
    (define-key map (kbd "F") #'vc-update)       ; symmetric with P: `vc-push'
    (define-key map (kbd "d") #'vc-diff)         ; parallel to D: `vc-root-diff'
    (define-key map (kbd "k") #'vc-dir-clean-files)
    (define-key map (kbd "G") #'vc-revert)
    (let ((prot-vc-git-branch-map (make-sparse-keymap)))
      (define-key map "B" prot-vc-git-branch-map)
      (define-key prot-vc-git-branch-map "n" #'vc-create-tag) ; new branch/tag
      (define-key prot-vc-git-branch-map "s" #'vc-retrieve-tag) ; switch branch/tag
      (define-key prot-vc-git-branch-map "c" #'prot-vc-git-checkout-remote) ; "checkout" remote
      (define-key prot-vc-git-branch-map "l" #'vc-print-branch-log))
    (let ((prot-vc-git-stash-map (make-sparse-keymap)))
      (define-key map "S" prot-vc-git-stash-map)
      (define-key prot-vc-git-stash-map "c" 'vc-git-stash) ; "create" named stash
      (define-key prot-vc-git-stash-map "s" 'vc-git-stash-snapshot)))
  (let ((map vc-git-stash-shared-map))
    (define-key map "a" 'vc-git-stash-apply-at-point)
    (define-key map "c" 'vc-git-stash) ; "create" named stash
    (define-key map "D" 'vc-git-stash-delete-at-point)
    (define-key map "p" 'vc-git-stash-pop-at-point)
    (define-key map "s" 'vc-git-stash-snapshot))
  (let ((map vc-annotate-mode-map))
    (define-key map (kbd "M-q") #'vc-annotate-toggle-annotation-visibility)
    (define-key map (kbd "C-c C-c") #'vc-annotate-goto-line)
    (define-key map (kbd "<return>") #'vc-annotate-find-revision-at-line))
  (let ((map log-view-mode-map))
    (define-key map (kbd "<tab>") #'log-view-toggle-entry-display)
    (define-key map (kbd "<return>") #'log-view-find-revision)
    (define-key map (kbd "s") #'vc-log-search)
    (define-key map (kbd "o") #'vc-log-outgoing)
    (define-key map (kbd "f") #'vc-log-incoming)
    (define-key map (kbd "F") #'vc-update)
    (define-key map (kbd "P") #'vc-push)))

(prot-emacs-builtin-package 'prot-vc
  (setq prot-vc-log-limit 100)
  (setq prot-vc-log-bulk-action-limit 50)
  (setq prot-vc-git-log-edit-show-commits t)
  (setq prot-vc-git-log-edit-show-commit-count 10)
  (setq prot-vc-shell-output "*prot-vc-output*")
  (setq prot-vc-patch-output-dirs (list "~/" "~/Desktop/"))
  (add-to-list' log-edit-headers-alist '("Amend"))

  ;; This refashions log view and log edit buffers
  (prot-vc-git-setup-mode 1)

  ;; NOTE: I override lots of the defaults
  (let ((map global-map))
    (define-key map (kbd "C-x v i") #'prot-vc-git-log-insert-commits)
    (define-key map (kbd "C-x v p") #'prot-vc-project-or-dir)
    (define-key map (kbd "C-x v SPC") #'prot-vc-custom-log)
    (define-key map (kbd "C-x v g") #'prot-vc-git-grep)
    (define-key map (kbd "C-x v G") #'prot-vc-git-log-grep)
    (define-key map (kbd "C-x v c") #'prot-vc-git-patch-dwim)
    (define-key map (kbd "C-x v s") #'prot-vc-git-show)
    (define-key map (kbd "C-x v r") #'prot-vc-git-find-revision)
    (define-key map (kbd "C-x v B") #'prot-vc-git-blame-region-or-file)
    (define-key map (kbd "C-x v R") #'prot-vc-git-reset))
  (let ((map vc-git-log-edit-mode-map))
    (define-key map (kbd "C-C C-n") #'prot-vc-git-log-edit-extract-file-name)
    (define-key map (kbd "C-C C-i") #'prot-vc-git-log-insert-commits)
    ;; Also done by `prot-vc-git-setup-mode', but I am putting it here
    ;; as well for visibility.
    (define-key map (kbd "C-c C-c") #'prot-vc-git-log-edit-done)
    (define-key map (kbd "C-c C-a") #'prot-vc-git-log-edit-toggle-amend)
    (define-key map (kbd "M-p") #'prot-vc-git-log-edit-previous-comment)
    (define-key map (kbd "M-n") #'prot-vc-git-log-edit-next-comment)
    (define-key map (kbd "M-s") #'prot-vc-git-log-edit-complete-comment)
    (define-key map (kbd "M-r") #'prot-vc-git-log-edit-complete-comment))
  (let ((map log-view-mode-map))
    (define-key map (kbd "<C-tab>") #'prot-vc-log-view-toggle-entry-all)
    (define-key map (kbd "c") #'prot-vc-git-patch-dwim)
    (define-key map (kbd "R") #'prot-vc-git-log-reset)
    (define-key map (kbd "w") #'prot-vc-log-kill-hash)))

;; Project repo: <https://git.sr.ht/~yoctocell/git-email>.  This is one
;; of the packages I handle manually via git, at least until it becomes
;; available through an ELPA.
;;
;; `prot-emacs-manual-package' is defined in my init.el
(prot-emacs-manual-package 'git-email
  (with-eval-after-load 'notmuch
    (require 'git-email-notmuch)
    (git-email-notmuch-mode 1))
  (define-key global-map (kbd "C-x v RET") #'git-email-format-patch) ; VC prefix and C-m
  (define-key dired-mode-map (kbd "C-x v RET") #'git-email-send-email))

(prot-emacs-elpa-package 'magit
  (setq magit-define-global-key-bindings nil)
  (define-key global-map (kbd "C-c g") #'magit-status)

  (require 'git-commit)
  (setq git-commit-summary-max-length 50)
  (setq git-commit-known-pseudo-headers
        '("Signed-off-by"
          "Acked-by"
          "Modified-by"
          "Cc"
          "Suggested-by"
          "Reported-by"
          "Tested-by"
          "Reviewed-by"))
  (setq git-commit-style-convention-checks
        '(non-empty-second-line
          overlong-summary-line))

  (require 'magit-diff)
  (setq magit-diff-refine-hunk t)

  (require 'magit-repos)
  (setq magit-repository-directories
        '(("~/Git/Projects" . 1))))

(prot-emacs-builtin-package 'smerge-mode)

(prot-emacs-builtin-package 'ediff
  (setq ediff-keep-variants nil)
  (setq ediff-make-buffers-readonly-at-startup nil)
  (setq ediff-merge-revisions-with-ancestor t)
  (setq ediff-show-clashes-only t)
  (setq ediff-split-window-function 'split-window-horizontally)
  (setq ediff-window-setup-function 'ediff-setup-windows-plain)

  ;; Tweak those for safer identification and removal
  (setq ediff-combination-pattern
        '("<<<<<<< prot-ediff-combine Variant A" A
          ">>>>>>> prot-ediff-combine Variant B" B
          "####### prot-ediff-combine Ancestor" Ancestor
          "======= prot-ediff-combine End"))

  ;; TODO automate process in a robust way, or at least offer a good key
  ;; binding.
  (defun prot/ediff-flush-combination-pattern ()
    "Remove my custom `ediff-combination-pattern' markers.

This is a quick-and-dirty way to get rid of the markers that are
left behind by `smerge-ediff' when combining the output of two
diffs.  While this could be automated via a hook, I am not yet
sure this is a good approach."
    (interactive)
    (flush-lines ".*prot-ediff.*" (point-min) (point-max) nil)))

(prot-emacs-builtin-package 'eshell
  (require 'esh-mode)
  (require 'esh-module)
  (setq eshell-modules-list             ; It works but may need review
        '(eshell-alias
          eshell-basic
          eshell-cmpl
          eshell-dirs
          eshell-glob
          eshell-hist
          eshell-ls
          eshell-pred
          eshell-prompt
          eshell-script
          eshell-term
          eshell-tramp
          eshell-unix))
  (setenv "PAGER" "cat") ; solves issues, such as with 'git log' and the default 'less'
  (require 'em-cmpl)
  (require 'em-dirs)
  (setq eshell-cd-on-directory t)

  (require 'em-tramp)
  (setq password-cache t)
  (setq password-cache-expiry 600)

  (require 'em-hist)
  (setq eshell-hist-ignoredups t)
  (setq eshell-save-history-on-exit t))

(prot-emacs-builtin-package 'prot-eshell
  (setq prot-eshell-output-buffer "*Exported Eshell output*")
  (setq prot-eshell-output-delimiter "* * *")
  (define-key global-map (kbd "<s-return>") #'eshell)
  (let ((map eshell-mode-map))
    (define-key map (kbd "M-k") #'eshell-kill-input)
    (define-key map (kbd "C-c C-f") #'prot-eshell-ffap-find-file)
    (define-key map (kbd "C-c C-j") #'prot-eshell-ffap-dired-jump)
    (define-key map (kbd "C-c C-w") #'prot-eshell-ffap-kill-save)
    (define-key map (kbd "C-c C->") #'prot-eshell-redirect-to-buffer)
    (define-key map (kbd "C-c C-e") #'prot-eshell-export)
    (define-key map (kbd "C-c C-r") #'prot-eshell-root-dir))
  (let ((map eshell-cmpl-mode-map))
    (define-key map (kbd "C-c TAB") #'prot-eshell-ffap-insert) ; C-c C-i
    (define-key map (kbd "C-c M-h") #'prot-eshell-narrow-output-highlight-regexp))
  (let ((map eshell-hist-mode-map))
    (define-key map (kbd "M-s") #'nil) ; I use this prefix for lots of more useful commands
    (define-key map (kbd "M-r") #'prot-eshell-complete-history)
    (define-key map (kbd "C-c C-d") #'prot-eshell-complete-recent-dir)
    (define-key map (kbd "C-c C-s") #'prot-eshell-find-subdirectory-recursive)))

(prot-emacs-builtin-package 'shell
  (setq ansi-color-for-comint-mode t)
  (setq shell-command-prompt-show-cwd t) ; Emacs 27.1
  (define-key global-map (kbd "<s-S-return>") #'shell))

;; Pro tip: If you are reading the source code, use C-c '
;; (`org-edit-special') to put the code block in a dedicated buffer and
;; then activate `prot-outline-minor-mode-safe' to conveniently browse
;; this massive code block.
(prot-emacs-builtin-package 'org
  (setq org-directory (convert-standard-filename "~/Org"))
  (setq org-imenu-depth 7)
;;;; general settings
  (setq org-adapt-indentation nil)      ; No, non, nein, όχι!
  (setq org-special-ctrl-a/e nil)
  (setq org-special-ctrl-k nil)
  (setq org-M-RET-may-split-line '((default . nil)))
  (setq org-hide-emphasis-markers t)
  (setq org-hide-macro-markers t)
  (setq org-hide-leading-stars nil)
  (setq org-structure-template-alist    ; CHANGED in Org 9.3, Emacs 27.1
        '(("s" . "src")
          ("E" . "src emacs-lisp")
          ("e" . "example")
          ("q" . "quote")
          ("v" . "verse")
          ("V" . "verbatim")
          ("c" . "center")
          ("C" . "comment")))
  (setq org-catch-invisible-edits 'show)
  (setq org-return-follows-link nil)
  (setq org-loop-over-headlines-in-active-region 'start-level)
  (setq org-modules '(ol-info ol-eww))
  (setq org-use-sub-superscripts '{})
  (setq org-insert-heading-respect-content t)

;;;; refile, todo
  (setq org-refile-targets
        '((org-agenda-files . (:maxlevel . 2))
          (nil . (:maxlevel . 2))))
  (setq org-refile-use-outline-path t)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-use-cache t)
  (setq org-reverse-note-order nil)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(D)" "CANCEL(C)")
          (sequence "MEET(m)" "|" "MET(M)")
          (sequence "STUDY(s)" "|" "STUDIED(S)")
          (sequence "WRITE(w)" "|" "WROTE(W)")))
  (setq org-todo-keyword-faces
        '(("MEET" . '(font-lock-preprocessor-face org-todo))
          ("STUDY" . '(font-lock-variable-name-face org-todo))
          ("WRITE" . '(font-lock-type-face org-todo))))
  (setq org-priority-faces
        '((?A . '(org-scheduled-today org-priority))
          (?B . org-priority)
          (?C . '(shadow org-priority))))
  (setq org-fontify-done-headline nil)
  (setq org-fontify-quote-and-verse-blocks t)
  (setq org-fontify-whole-heading-line nil)
  (setq org-fontify-whole-block-delimiter-line nil)

  (defun prot/modus-themes-org-fontify-block-delimiter-lines ()
    "Match `org-fontify-whole-block-delimiter-line' to theme style.
Run this function at the post theme load phase, such as with the
hook `modus-themes-after-load-theme-hook'."
    (if (eq modus-themes-org-blocks 'gray-background)
        (setq org-fontify-whole-block-delimiter-line t)
      (setq org-fontify-whole-block-delimiter-line nil))
    (when (derived-mode-p 'org-mode)
      (font-lock-flush)))

  (add-hook 'modus-themes-after-load-theme-hook
            #'prot/modus-themes-org-fontify-block-delimiter-lines)

  (setq org-highlight-latex-and-related nil) ; other options affect elisp regexp in src blocks
  (setq org-enforce-todo-dependencies t)
  (setq org-enforce-todo-checkbox-dependencies t)
  (setq org-track-ordered-property-with-tag t)
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?C)
  (setq org-default-priority ?A)

;;;; tags
  (setq org-tag-alist                   ; TODO review org tag list
        '((:startgroup)
          ("@work")
          ("@priv")
          (:endgroup)
          ("emacs")
          ("modus")
          ("politics")
          ("economics")
          ("philosophy")
          ("paper")
          ("book")
          ("essay")
          ("article")
          ("mail")
          ("website")))

;;;; log
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-log-note-clock-out nil)
  (setq org-log-redeadline nil)
  (setq org-log-reschedule nil)
  (setq org-read-date-prefer-future 'time)

;;;; links
  (setq org-link-keep-stored-after-insertion t)

;;;; capture
  (setq org-capture-templates
        `(("b" "Basic task for future review" entry
           (file+headline "tasks.org" "Basic tasks that need to be reviewed")
           ,(concat "* %^{Title}\n"
                    ":PROPERTIES:\n"
                    ":CAPTURED: %U\n"
                    ":END:\n\n"
                    "%i%l"))
          ("t" "Task with a due date" entry
           (file+headline "tasks.org" "Task list with a date")
           ,(concat "* %^{Scope of task||TODO|STUDY|MEET} %^{Title} %^g\n"
                    "SCHEDULED: %^t\n"
                    ":PROPERTIES:\n:CAPTURED: %U\n:END:\n\n"
                    "%i%?"))
          ("m" "Make email note" entry
           (file+headline "tasks.org" "Mail correspondence")
           ,(concat "* TODO [#A] %:subject :mail:\n"
                    "SCHEDULED: %t\n:"
                    "PROPERTIES:\n:CONTEXT: %a\n:END:\n\n"
                    "%i%?"))))

  (setq org-capture-templates-contexts
        '(("m" ((in-mode . "notmuch-search-mode")
                (in-mode . "notmuch-show-mode")
                (in-mode . "notmuch-tree-mode")))))

  ;; Source: https://stackoverflow.com/a/54251825
  (defun contrib/org-capture-no-delete-windows (oldfun args)
    (cl-letf (((symbol-function 'delete-other-windows) 'ignore))
      (apply oldfun args)))

  ;; Same source as above
  (advice-add 'org-capture-place-template
              :around 'contrib/org-capture-no-delete-windows)

;;;; agenda
;;;;; Basic agenda setup
  (setq org-default-notes-file (thread-last org-directory (expand-file-name "notes.org")))
  (setq org-agenda-files `(,org-directory "~/Documents"))
  (setq org-agenda-span 14)
  (setq org-agenda-start-on-weekday 1)  ; Monday
  (setq org-agenda-confirm-kill t)
  (setq org-agenda-show-all-dates t)
  (setq org-agenda-show-outline-path nil)
  (setq org-agenda-window-setup 'current-window)
  (setq org-agenda-skip-comment-trees t)
  (setq org-agenda-menu-show-matcher t)
  (setq org-agenda-menu-two-columns nil)
  (setq org-agenda-sticky nil)
  (setq org-agenda-custom-commands-contexts nil)
  (setq org-agenda-max-entries nil)
  (setq org-agenda-max-todos nil)
  (setq org-agenda-max-tags nil)
  (setq org-agenda-max-effort nil)

;;;;; General agenda view options
  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo . " %i %-12:c")
          (tags . " %i %-12:c")
          (search . " %i %-12:c")))
  (setq org-agenda-sorting-strategy
        '(((agenda habit-down time-up priority-down category-keep)
           (todo priority-down category-keep)
           (tags priority-down category-keep)
           (search category-keep))))
  (setq org-agenda-breadcrumbs-separator "->")
  (setq org-agenda-todo-keyword-format "%-1s")
  (setq org-agenda-fontify-priorities 'cookies)
  (setq org-agenda-category-icon-alist nil)
  (setq org-agenda-remove-times-when-in-prefix nil)
  (setq org-agenda-remove-timeranges-from-blocks nil)
  (setq org-agenda-compact-blocks nil)
  (setq org-agenda-block-separator ?—)

  (defun prot/org-agenda-format-date-aligned (date)
    "Format a DATE string for display in the daily/weekly agenda.
This function makes sure that dates are aligned for easy reading.

Slightly tweaked version of `org-agenda-format-date-aligned' that
produces dates with a fixed length."
    (require 'cal-iso)
    (let* ((dayname (calendar-day-name date t))
           (day (cadr date))
           (day-of-week (calendar-day-of-week date))
           (month (car date))
           (monthname (calendar-month-name month t))
           (year (nth 2 date))
           (iso-week (org-days-to-iso-week
                      (calendar-absolute-from-gregorian date)))
           (weekyear (cond ((and (= month 1) (>= iso-week 52))
                            (1- year))
                           ((and (= month 12) (<= iso-week 1))
                            (1+ year))
                           (t year)))
           (weekstring (if (= day-of-week 1)
                           (format " (W%02d)" iso-week)
                         "")))
      (format "%s %2d %s %4d%s"
              dayname day monthname year weekstring)))

  (setq org-agenda-format-date #'prot/org-agenda-format-date-aligned)

;;;;; Agenda marks
  (setq org-agenda-bulk-mark-char "#")
  (setq org-agenda-persistent-marks nil)

;;;;; Agenda diary entries
  (setq org-agenda-insert-diary-strategy 'date-tree)
  (setq org-agenda-insert-diary-extract-time nil)
  (setq org-agenda-include-diary t)

;;;;; Agenda follow mode
  (setq org-agenda-start-with-follow-mode nil)
  (setq org-agenda-follow-indirect t)

;;;;; Agenda multi-item tasks
  (setq org-agenda-dim-blocked-tasks t)
  (setq org-agenda-todo-list-sublevels t)

;;;;; Agenda filters and restricted views
  (setq org-agenda-persistent-filter nil)
  (setq org-agenda-restriction-lock-highlight-subtree t)

;;;;; Agenda items with deadline and scheduled timestamps
  (setq org-agenda-include-deadlines t)
  (setq org-deadline-warning-days 5)
  (setq org-agenda-skip-scheduled-if-done nil)
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  (setq org-agenda-skip-timestamp-if-deadline-is-shown t)
  (setq org-agenda-skip-deadline-if-done nil)
  (setq org-agenda-skip-deadline-prewarning-if-scheduled 1)
  (setq org-agenda-skip-scheduled-delay-if-deadline nil)
  (setq org-agenda-skip-additional-timestamps-same-entry nil)
  (setq org-agenda-skip-timestamp-if-done nil)
  (setq org-agenda-search-headline-for-time t)
  (setq org-scheduled-past-days 365)
  (setq org-deadline-past-days 365)
  (setq org-agenda-move-date-from-past-immediately-to-today t)
  (setq org-agenda-show-future-repeats t)
  (setq org-agenda-prefer-last-repeat nil)
  (setq org-agenda-timerange-leaders
        '("" "(%d/%d): "))
  (setq org-agenda-scheduled-leaders
        '("Scheduled: " "Sched.%2dx: "))
  (setq org-agenda-inactive-leader "[")
  (setq org-agenda-deadline-leaders
        '("Deadline:  " "In %3d d.: " "%2d d. ago: "))
  ;; Time grid
  (setq org-agenda-time-leading-zero t)
  (setq org-agenda-timegrid-use-ampm nil)
  (setq org-agenda-use-time-grid t)
  (setq org-agenda-show-current-time-in-grid t)
  (setq org-agenda-current-time-string
        (concat "Now " (make-string 36 ?—)))
  (setq org-agenda-time-grid
        '((daily today require-timed)
          (0600 0700 0800 0900 1000 1100
                1200 1300 1400 1500 1600
                1700 1800 1900 2000 2100)
          " ....." "-----------------"))
  (setq org-agenda-default-appointment-duration nil)

;;;;; Agenda global to-do list
  (setq org-agenda-todo-ignore-with-date t)
  (setq org-agenda-todo-ignore-timestamp t)
  (setq org-agenda-todo-ignore-scheduled t)
  (setq org-agenda-todo-ignore-deadlines t)
  (setq org-agenda-todo-ignore-time-comparison-use-seconds t)
  (setq org-agenda-tags-todo-honor-ignore-options nil)

;;;;; Agenda tagged items
  (setq org-agenda-show-inherited-tags t)
  (setq org-agenda-use-tag-inheritance
        '(todo search agenda))
  (setq org-agenda-hide-tags-regexp nil)
  (setq org-agenda-remove-tags nil)
  (setq org-agenda-tags-column -120)

;;;;; Agenda entry
  ;; NOTE: I do not use this right now.  Leaving everything to its
  ;; default value.
  (setq org-agenda-start-with-entry-text-mode nil)
  (setq org-agenda-entry-text-maxlines 5)
  (setq org-agenda-entry-text-exclude-regexps nil)
  (setq org-agenda-entry-text-leaders "    > ")

;;;;; Agenda logging and clocking
  ;; NOTE: I do not use these yet, though I plan to.  Leaving everything
  ;; to its default value for the time being.
  (setq org-agenda-log-mode-items '(closed clock))
  (setq org-agenda-clock-consistency-checks
        '((:max-duration "10:00" :min-duration 0 :max-gap "0:05" :gap-ok-around
                         ("4:00")
                         :default-face ; This should definitely be reviewed
                         ((:background "DarkRed")
                          (:foreground "white"))
                         :overlap-face nil :gap-face nil :no-end-time-face nil
                         :long-face nil :short-face nil)))
  (setq org-agenda-log-mode-add-notes t)
  (setq org-agenda-start-with-log-mode nil)
  (setq org-agenda-start-with-clockreport-mode nil)
  (setq org-agenda-clockreport-parameter-plist '(:link t :maxlevel 2))
  (setq org-agenda-search-view-always-boolean nil)
  (setq org-agenda-search-view-force-full-words nil)
  (setq org-agenda-search-view-max-outline-level 0)
  (setq org-agenda-search-headline-for-time t)
  (setq org-agenda-use-time-grid t)
  (setq org-agenda-cmp-user-defined nil)
  (setq org-agenda-sort-notime-is-late t) ; Org 9.4
  (setq org-agenda-sort-noeffort-is-high t) ; Org 9.4

;;;;; Agenda column view
  ;; NOTE I do not use these, but may need them in the future.
  (setq org-agenda-view-columns-initially nil)
  (setq org-agenda-columns-show-summaries t)
  (setq org-agenda-columns-compute-summary-properties t)
  (setq org-agenda-columns-add-appointments-to-effort-sum nil)
  (setq org-agenda-auto-exclude-function nil)
  (setq org-agenda-bulk-custom-functions nil)

;;;; code blocks
  (setq org-confirm-babel-evaluate nil)
  (setq org-src-window-setup 'current-window)
  (setq org-edit-src-persistent-message nil)
  (setq org-src-fontify-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-src-tab-acts-natively t)
  (setq org-edit-src-content-indentation 0)

;;;; export
  (setq org-export-with-toc t)
  (setq org-export-headline-levels 8)
  (setq org-export-dispatch-use-expert-ui nil)
  (setq org-html-htmlize-output-type nil)
  (setq org-html-head-include-default-style nil)
  (setq org-html-head-include-scripts nil)
  (require 'ox-texinfo)
  ;; FIXME: how to remove everything else?
  (setq org-export-backends '(html texinfo))

  (defun prot/ox-html ()
    (interactive)
    (org-html-export-as-html nil nil nil t nil))

  (defun prot/ox-texinfo ()
    (interactive)
    (org-texinfo-export-to-info))

;;;; IDs
  (setq org-id-link-to-org-use-id
        'create-if-interactive-and-no-custom-id)

  (declare-function org-id-add-location "org")

  ;; Copied from this article (with minor tweaks from my side):
  ;; <https://writequit.org/articles/emacs-org-mode-generate-ids.html>.
  (defun contrib/org-id-get (&optional pom create prefix)
    "Get the CUSTOM_ID property of the entry at point-or-marker
POM. If POM is nil, refer to the entry at point. If the entry
does not have an CUSTOM_ID, the function returns nil. However,
when CREATE is non nil, create a CUSTOM_ID if none is present
already. PREFIX will be passed through to `org-id-new'. In any
case, the CUSTOM_ID of the entry is returned."
    (org-with-point-at pom
      (let ((id (org-entry-get nil "CUSTOM_ID")))
        (cond
         ((and id (stringp id) (string-match "\\S-" id))
          id)
         (create
          (setq id (org-id-new (concat prefix "h")))
          (org-entry-put pom "CUSTOM_ID" id)
          (org-id-add-location id (format "%s" (buffer-file-name (buffer-base-buffer))))
          id)))))

  (defun contrib/org-id-headlines ()
    "Add CUSTOM_ID properties to all headlines in the current
file which do not already have one."
    (interactive)
    (org-map-entries
     (lambda () (contrib/org-id-get (point) t))))

  (add-hook 'org-follow-link-hook #'prot-pulse-recentre-top)
  (let ((map global-map))
    (define-key map (kbd "C-c a") #'org-agenda)
    (define-key map (kbd "C-c c") #'org-capture)
    (define-key map (kbd "C-c l") #'org-store-link))
  (let ((map org-mode-map))
    (define-key map (kbd "C-'") nil)
    (define-key map (kbd "C-,") nil)
    (define-key map (kbd "<C-return>") nil)
    (define-key map (kbd "<C-S-return>") nil)
    (define-key map (kbd "C-c S-l") #'org-toggle-link-display)
    (define-key map (kbd "C-c C-S-l") #'org-insert-last-stored-link)))

(prot-emacs-builtin-package 'calendar
  (setq calendar-mark-diary-entries-flag t)
  (setq calendar-mark-holidays-flag t)
  (setq calendar-mode-line-format nil)
  (setq calendar-time-display-form
        '(24-hours ":" minutes
                   (when time-zone
                     (format "(%s)" time-zone))))
  (setq calendar-week-start-day 1)      ; Monday
  (setq calendar-date-style 'iso)
  (setq calendar-date-display-form calendar-iso-date-display-form)
  (setq calendar-time-zone-style 'numeric) ; Emacs 28.1

  (require 'solar)
  (setq calendar-latitude 35.17         ; Not my actual coordinates
        calendar-longitude 33.36)

  (require 'cal-dst)
  (setq calendar-standard-time-zone-name "+0200")
  (setq calendar-daylight-time-zone-name "+0300")

  (require 'diary-lib)
  (setq diary-mail-addr user-mail-address)
  (setq diary-date-forms diary-iso-date-forms)
  (setq diary-comment-start ";;")
  (setq diary-comment-end "")
  (setq diary-nonmarking-symbol "!")
  (setq diary-show-holidays-flag t)
  (setq diary-display-function #'diary-fancy-display) ; better than its alternative
  (setq diary-header-line-format nil)
  (setq diary-list-include-blanks nil)
  (setq diary-number-of-entries 2)
  (setq diary-mail-days 2)
  (setq diary-abbreviated-year-flag nil)

  (add-hook 'calendar-today-visible-hook #'calendar-mark-today)
  (add-hook 'diary-list-entries-hook 'diary-sort-entries t)
  (add-hook 'diary-mode-hook #'goto-address-mode) ; buttonise plain text links

  ;; Those presuppose (setq diary-display-function #'diary-fancy-display)
  (add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
  (add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

  ;; Prevent Org from interfering with my key bindings.
  (remove-hook 'calendar-mode-hook #'org--setup-calendar-bindings)

  (let ((map calendar-mode-map))
    (define-key map (kbd "s") #'calendar-sunrise-sunset)
    (define-key map (kbd "l") #'lunar-phases)
    (define-key map (kbd "i") nil) ; Org sets this, much to my chagrin (see `remove-hook' above)
    (define-key map (kbd "i a") #'diary-insert-anniversary-entry)
    (define-key map (kbd "i b") #'diary-insert-block-entry)
    (define-key map (kbd "i c") #'diary-insert-cyclic-entry)
    (define-key map (kbd "i d") #'diary-insert-entry) ; for current "day"
    (define-key map (kbd "i i") #'diary-insert-entry) ; most common action, easier to type
    (define-key map (kbd "i m") #'diary-insert-monthly-entry)
    (define-key map (kbd "i w") #'diary-insert-weekly-entry)
    (define-key map (kbd "i y") #'diary-insert-yearly-entry)
    (define-key map (kbd "M-n") #'calendar-forward-month)
    (define-key map (kbd "M-p") #'calendar-backward-month)))

(prot-emacs-builtin-package 'appt
  (setq appt-display-diary nil)
  (setq appt-disp-window-function #'appt-disp-window)
  (setq appt-display-mode-line t)
  (setq appt-display-interval 3)
  (setq appt-audible nil)
  (setq appt-warning-time-regexp "appt \\([0-9]+\\)")
  (setq appt-message-warning-time 15)

  (run-at-time 10 nil #'appt-activate 1))

(prot-emacs-builtin-package 'prot-diary
  ;; The idea is to get a reminder via email when I launch Emacs in the
  ;; morning and this file is evaluated.  Obviously this is not a super
  ;; sophisticated approach, though I do not need one.
  (let ((time (string-to-number (format-time-string "%H"))))
    (when (and (> time 4) (< time 9))
      (run-at-time 30 nil #'prot-diary-mail-entries)))

  (require 'holidays)
  (setq calendar-holidays (append holiday-solar-holidays prot-diary-local-holidays))

  (with-eval-after-load 'prot-outline
    (add-hook 'diary-mode-hook #'prot-outline-minor-mode-safe))

  (let ((map diary-mode-map))
    (define-key map (kbd "<M-return>") #'prot-diary-newline-indent)
    (define-key map (kbd "M-n") #'prot-diary-heading-next)
    (define-key map (kbd "M-p") #'prot-diary-heading-previous)
    (define-key map (kbd "C-c C-a") #'prot-diary-align-timestamped-entries))
  (let ((map global-map))
    (define-key map (kbd "C-c d c") #'calendar)
    (define-key map (kbd "C-c d d") #'prot-diary-display-entries)
    (define-key map (kbd "C-c d e") #'prot-diary-edit-diary)
    (define-key map (kbd "C-c d i") #'prot-diary-insert-entry)
    (define-key map (kbd "C-c d m") #'prot-diary-mail-entries)))

(prot-emacs-builtin-package 'auth-source
  (setq auth-sources '("~/.authinfo.gpg"))
  (setq user-full-name "Protesilaos Stavrou")
  (setq user-mail-address "public@protesilaos.com"))

(prot-emacs-builtin-package 'mm-encode
  (setq mm-encrypt-option nil) ; use 'guided if you need more control
  (setq mm-sign-option nil))   ; same

(prot-emacs-builtin-package 'mml-sec
  (setq mml-secure-openpgp-encrypt-to-self t)
  (setq mml-secure-openpgp-sign-with-sender t)
  (setq mml-secure-smime-encrypt-to-self t)
  (setq mml-secure-smime-sign-with-sender t))

(prot-emacs-builtin-package 'message
  (setq mail-user-agent 'message-user-agent)
  (setq mail-header-separator (purecopy "*****"))
  (setq compose-mail-user-agent-warnings nil)
  (setq message-mail-user-agent t)      ; use `mail-user-agent'
  (setq mail-signature "Protesilaos Stavrou\nhttps://protesilaos.com\n")
  (setq message-signature "Protesilaos Stavrou\nhttps://protesilaos.com\n")
  (setq message-citation-line-format "On %Y-%m-%d, %R %z, %f wrote:\n")
  (setq message-citation-line-function
        'message-insert-formatted-citation-line)
  (setq message-confirm-send nil)
  (setq message-kill-buffer-on-exit t)
  (setq message-wide-reply-confirm-recipients t)
  (add-to-list 'mm-body-charset-encoding-alist '(utf-8 . base64))

  (add-hook 'message-setup-hook #'message-sort-headers))

(prot-emacs-builtin-package 'gnus-dired ; does not require `gnus'
  (add-hook 'dired-mode-hook #'gnus-dired-mode))

(prot-emacs-builtin-package 'prot-mail
  ;; NOTE 2021-05-14: This is a generic indicator for new mail in the
  ;; maildir.  As I now use notmuch (see relevant section in this
  ;; document) I have an alternative approach in prot-notmuch.el.
  (setq prot-mail-maildir-path-regexp "~/.mail/*/Inbox/new/") ; shell regexp
  (setq prot-mail-mode-line-indicator-commands
        '(notmuch-refresh-this-buffer))
  ;; mode line indicator with the number of new mails
  (prot-mail-mail-indicator -1))

;; I install notmuch from the distro's repos because the CLI program is
;; not dependent on Emacs.  Though the package also includes notmuch.el
;; which is what we use here (they are maintained by the same people).
(add-to-list 'load-path "/usr/share/emacs/site-lisp/")
(prot-emacs-builtin-package 'notmuch

;;; Account settings
 ;;  (setq notmuch-identities
;;         (let ((identities))
;;           (dolist (m `(,(prot-mail-auth-get-field "prv" :user)
;;                        ,(prot-mail-auth-get-field "inf" :user)
;;                        ,(prot-mail-auth-get-field "pub" :user)))
;;             (push (format "%s <%s>" user-full-name m) identities))
;;           identities))
;;   (setq notmuch-fcc-dirs
;;         `((,(prot-mail-auth-get-field "prv" :user) . "prv/Sent")
;;           (,(prot-mail-auth-get-field "inf" :user) . "inf/Sent")
;;           (,(prot-mail-auth-get-field "pub" :user) . "pub/Sent")))

;; ;
  ;; General UI
  (setq notmuch-show-logo nil)
  (setq notmuch-column-control t)
  (setq notmuch-hello-auto-refresh t)
  (setq notmuch-hello-recent-searches-max 20)
  (setq notmuch-hello-thousands-separator "")
  ;; ;; See my variant of it in `prot-notmuch' below.
  ;; (setq notmuch-hello-sections '(notmuch-hello-insert-saved-searches))
  (setq notmuch-show-all-tags-list nil)

;;; Search
  (setq notmuch-search-oldest-first nil)
  (setq notmuch-search-result-format
        '(("date" . "%12s  ")
          ("count" . "%-7s  ")
          ("authors" . "%-20s  ")
          ("subject" . "%-80s  ")
          ("tags" . "(%s)")))
  (setq notmuch-tree-result-format
        '(("date" . "%12s  ")
          ("authors" . "%-20s  ")
          ((("tree" . "%s")
            ("subject" . "%s"))
           . " %-80s  ")
          ("tags" . "(%s)")))
  (setq notmuch-search-line-faces
        '(("unread" . notmuch-search-unread-face)
          ("flag" . notmuch-search-flagged-face)))
  (setq notmuch-show-empty-saved-searches t)
  (setq notmuch-saved-searches
        `(( :name "inbox"
            :query "tag:inbox"
            :sort-order newest-first
            :key ,(kbd "i"))
          ( :name "unread (inbox)"
            :query "tag:unread and tag:inbox"
            :sort-order newest-first
            :key ,(kbd "u"))
          ( :name "unread all"
            :query "tag:unread not tag:archived"
            :sort-order newest-first
            :key ,(kbd "U"))
          ( :name "references"
            :query "tag:ref not tag:archived"
            :sort-order newest-first
            :key ,(kbd "r"))
          ( :name "todo"
            :query "tag:todo not tag:archived"
            :sort-order newest-first
            :key ,(kbd "t"))
          ( :name "mailing lists"
            :query "tag:list not tag:archived"
            :sort-order newest-first
            :key ,(kbd "m"))
          ;; Emacs
          ( :name "emacs-devel"
            :query "(from:emacs-devel@gnu.org or to:emacs-devel@gnu.org) not tag:archived"
            :sort-order newest-first
            :key ,(kbd "e d"))
          ( :name "emacs-orgmode"
            :query "(from:emacs-orgmode@gnu.org or to:emacs-orgmode@gnu.org) not tag:archived"
            :sort-order newest-first
            :key ,(kbd "e o"))
          ( :name "emacs-bugs"
            :query "'to:\"/*@debbugs.gnu.org*/\"' not tag:archived"
            :sort-order newest-first :key ,(kbd "e b"))
          ( :name "emacs-humanities" 
            :query "(from:emacs-humanities@gnu.org or to:emacs-humanities@gnu.org) not tag:archived"
            :sort-order newest-first :key ,(kbd "e h"))
          ;; CLI tools
          ( :name "notmuch"
            :query "(from:notmuch@notmuchmail.org or to:notmuch@notmuchmail.org) not tag:archived"
            :sort-order newest-first
            :key ,(kbd "cn"))))

;;; Tags
  (setq notmuch-archive-tags '("-inbox" "+archived"))
  (setq notmuch-message-replied-tags '("+replied"))
  (setq notmuch-message-forwarded-tags '("+forwarded"))
  (setq notmuch-show-mark-read-tags '("-unread"))
  (setq notmuch-draft-tags '("+draft"))
  (setq notmuch-draft-folder "drafts")
  (setq notmuch-draft-save-plaintext 'ask)
  (setq notmuch-tagging-keys
        `((,(kbd "a") notmuch-archive-tags "Archive (remove from inbox)")
          (,(kbd "c") ("+archived" "-inbox" "-list" "-todo" "-ref" "-unread") "Complete and archive")
          (,(kbd "d") ("+del" "-inbox" "-archived" "-unread") "Mark for deletion")
          (,(kbd "f") ("+flag" "-unread") "Flag as important")
          ;; (,(kbd "r") notmuch-show-mark-read-tags "Mark as read")
          (,(kbd "r") ("+ref" "-unread") "Reference for the future")
          (,(kbd "s") ("+spam" "+del" "-inbox" "-unread") "Mark as spam")
          (,(kbd "t") ("+todo" "-unread") "To-do")
          (,(kbd "u") ("+unread") "Mark as unread")))
  (setq notmuch-tag-formats
        '(("unread" (propertize tag 'face 'notmuch-tag-unread))
          ("flag" (propertize tag 'face 'notmuch-tag-flagged))))
  (setq notmuch-tag-deleted-formats
        '(("unread" (notmuch-apply-face bare-tag `notmuch-tag-deleted))
          (".*" (notmuch-apply-face tag `notmuch-tag-deleted))))

;;; Email composition
  (setq notmuch-mua-compose-in 'current-window)
  (setq notmuch-mua-hidden-headers nil) ; TODO 2021-05-12: Review hidden headers
  (setq notmuch-address-command nil)    ; FIXME 2021-05-13: Make it work with EBDB
  (setq notmuch-always-prompt-for-sender t)
  (setq notmuch-mua-cite-function 'message-cite-original-without-signature)
  (setq notmuch-mua-reply-insert-header-p-function 'notmuch-show-reply-insert-header-p-never)
  (setq notmuch-mua-user-agent-function #'notmuch-mua-user-agent-full)
  (setq notmuch-maildir-use-notmuch-insert t)
  (setq notmuch-crypto-process-mime t)
  (setq notmuch-crypto-get-keys-asynchronously t)
  (setq notmuch-mua-attachment-regexp   ; see `notmuch-mua-send-hook'
        (concat "\\b\\(attache\?ment\\|attached\\|attach\\|"
                "pi[èe]ce\s+jointe?\\|"
                "συνημμ[εέ]νο\\|επισυν[αά]πτω\\)\\b"))

;;; Reading messsages
  (setq notmuch-show-relative-dates t)
  (setq notmuch-show-all-multipart/alternative-parts nil)
  (setq notmuch-show-indent-messages-width 0)
  (setq notmuch-show-indent-multipart nil)
  (setq notmuch-show-part-button-default-action 'notmuch-show-save-part)
  (setq notmuch-show-text/html-blocked-images ".") ; block everything
  (setq notmuch-wash-citation-lines-prefix 6)
  (setq notmuch-wash-citation-lines-suffix 6)
  (setq notmuch-wash-wrap-lines-length 100)
  (setq notmuch-unthreaded-show-out nil)
  (setq notmuch-message-headers '("To" "Cc" "Subject" "Date"))
  (setq notmuch-message-headers-visible t)

;;; Hooks and key bindings
  (add-hook 'notmuch-mua-send-hook #'notmuch-mua-attachment-check)
  (remove-hook 'notmuch-show-hook #'notmuch-show-turn-on-visual-line-mode)
  (add-hook 'notmuch-show-hook (lambda () (setq-local header-line-format nil)))

  (let ((map global-map))
    (define-key map (kbd "C-c m") #'notmuch)
    (define-key map (kbd "C-x m") #'notmuch-mua-new-mail)) ; override `compose-mail'
   (let ((map notmuch-search-mode-map))
     (define-key map (kbd "/") #'notmuch-search-filter))) ; alias for l

(prot-emacs-builtin-package 'prot-notmuch
  (setq prot-notmuch-search-field-width 100)
  (setq notmuch-hello-sections '(prot-notmuch-hello-insert-saved-searches
                                 ;; prot-notmuch-hello-insert-recent-searches
                                 ))

  (add-to-list 'notmuch-tag-formats
               '("encrypted" (propertize tag 'face 'prot-notmuch-encrypted-tag)))
  (add-to-list 'notmuch-tag-formats
               '("sent" (propertize tag 'face 'prot-notmuch-sent-tag)))
  (add-to-list 'notmuch-tag-formats
               '("ref" (propertize tag 'face 'prot-notmuch-ref-tag)))
  (add-to-list 'notmuch-tag-formats
               '("todo" (propertize tag 'face 'prot-notmuch-todo-tag)))
  (add-to-list 'notmuch-tag-formats
               '("spam" (propertize tag 'face 'prot-notmuch-spam-tag)))

  ;; NOTE 2021-05-14: I have an alternative method of finding new mail
  ;; in a maildir tree by using the find command.  It is somewhat
  ;; simplistic, though it worked just fine: see prot-mail.el.  I prefer
  ;; this implementation instead, as it leverages notmuch and so I can
  ;; pass arbitrary search terms to it.
  (setq prot-notmuch-mode-line-count-args "tag:unread and tag:inbox")
  (setq prot-notmuch-mode-line-indicator-commands
        '(notmuch notmuch-refresh-this-buffer))
  ;; Mode line indicator with the number of new mails.
  (prot-notmuch-mail-indicator 1)

  (add-hook 'notmuch-hello-mode-hook #'prot-notmuch-widget-field-face-remap)

  (define-key notmuch-search-mode-map (kbd "g") #'prot-notmuch-refresh-buffer))

;;; ol-notmuch.el --- Links to notmuch messages

;; Copyright (C) 2010-2014  Matthieu Lemerre

;; Author: Matthieu Lemerre <racin@free.fr>
;; Keywords: outlines, hypermedia, calendar, wp
;; Homepage: https://orgmode.org

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This file implements links to notmuch messages and "searches". A
;; search is a query to be performed by notmuch; it is the equivalent
;; to folders in other mail clients. Similarly, mails are referred to
;; by a query, so both a link can refer to several mails.

;; Links have one the following form
;; notmuch:<search terms>
;; notmuch-search:<search terms>.

;; The first form open the queries in notmuch-show mode, whereas the
;; second link open it in notmuch-search mode. Note that queries are
;; performed at the time the link is opened, and the result may be
;; different from when the link was stored.

;;; Code:

(require 'ol)

;; customisable notmuch open functions
(defcustom org-notmuch-open-function
  'org-notmuch-follow-link
  "Function used to follow notmuch links.

Should accept a notmuch search string as the sole argument."
  :group 'org-notmuch
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'function)

(defcustom org-notmuch-search-open-function
  'org-notmuch-search-follow-link
  "Function used to follow notmuch-search links.
Should accept a notmuch search string as the sole argument."
  :group 'org-notmuch
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'function)

(make-obsolete-variable 'org-notmuch-search-open-function nil "9.3")



;; Install the link type
(org-link-set-parameters "notmuch"
			 :follow #'org-notmuch-open
			 :store #'org-notmuch-store-link)

(defun org-notmuch-store-link ()
  "Store a link to a notmuch search or message."
  (when (memq major-mode '(notmuch-show-mode notmuch-tree-mode))
    (let* ((message-id (notmuch-show-get-message-id t))
	   (subject (notmuch-show-get-subject))
	   (to (notmuch-show-get-to))
	   (from (notmuch-show-get-from))
	   (date (org-trim (notmuch-show-get-date)))
	   desc link)
      (org-link-store-props :type "notmuch" :from from :to to :date date
       			    :subject subject :message-id message-id)
      (setq desc (org-link-email-description))
      (setq link (concat "notmuch:id:" message-id))
      (org-link-add-props :link link :description desc)
      link)))

(defun org-notmuch-open (path _)
  "Follow a notmuch message link specified by PATH."
  (funcall org-notmuch-open-function path))

(defun org-notmuch-follow-link (search)
  "Follow a notmuch link to SEARCH.

Can link to more than one message, if so all matching messages are shown."
  (require 'notmuch)
  (notmuch-show search))



(org-link-set-parameters "notmuch-search"
			 :follow #'org-notmuch-search-open
			 :store #'org-notmuch-search-store-link)

(defun org-notmuch-search-store-link ()
  "Store a link to a notmuch search or message."
  (when (eq major-mode 'notmuch-search-mode)
    (let ((link (concat "notmuch-search:" notmuch-search-query-string))
	  (desc (concat "Notmuch search: " notmuch-search-query-string)))
      (org-link-store-props :type "notmuch-search"
			    :link link
			    :description desc)
      link)))

(defun org-notmuch-search-open (path _)
  "Follow a notmuch message link specified by PATH."
  (message "%s" path)
  (org-notmuch-search-follow-link path))

(defun org-notmuch-search-follow-link (search)
  "Follow a notmuch link by displaying SEARCH in notmuch-search mode."
  (require 'notmuch)
  (notmuch-search search))



(org-link-set-parameters "notmuch-tree"
			 :follow #'org-notmuch-tree-open
			 :store #'org-notmuch-tree-store-link)

(defun org-notmuch-tree-store-link ()
  "Store a link to a notmuch search or message."
  (when (eq major-mode 'notmuch-tree-mode)
    (let ((link (concat "notmuch-tree:" (notmuch-tree-get-query)))
	  (desc (concat "Notmuch tree: " (notmuch-tree-get-query))))
      (org-link-store-props :type "notmuch-tree"
			    :link link
			    :description desc)
      link)))

(defun org-notmuch-tree-open (path _)
  "Follow a notmuch message link specified by PATH."
  (message "%s" path)
  (org-notmuch-tree-follow-link path))

(defun org-notmuch-tree-follow-link (search)
  "Follow a notmuch link by displaying SEARCH in notmuch-tree mode."
  (require 'notmuch)
  (notmuch-tree search))

(provide 'ol-notmuch)

;;; ol-notmuch.el ends here

(require 'ol-notmuch)

(prot-emacs-builtin-package 'smtpmail
  (setq smtpmail-default-smtp-server "mail.gandi.net")
  (setq smtpmail-smtp-server "mail.gandi.net")
  (setq smtpmail-stream-type 'ssl)
  (setq smtpmail-smtp-service 465)
  (setq smtpmail-queue-mail nil))

(prot-emacs-builtin-package 'sendmail
  (setq send-mail-function 'smtpmail-send-it))

;; (prot-emacs-elpa-package 'ebdb
;;   (require 'ebdb-message)
;;   (require 'ebdb-notmuch) ; FIXME 2021-05-13: does not activate the corfu-mode UI
;;   (setq ebdb-sources (locate-user-emacs-file "ebdb"))
;;   (setq ebdb-permanent-ignores-file (locate-user-emacs-file "ebdb-permanent-ignores"))

;;   (setq ebdb-mua-pop-up nil)
;;   (setq ebdb-default-window-size 0.25)
;;   (setq ebdb-mua-default-formatter ebdb-default-multiline-formatter)

;;   (setq ebdb-mua-auto-update-p 'existing)
;;   (setq ebdb-mua-reader-update-p 'existing)
;;   (setq ebdb-mua-sender-update-p 'create)
;;   (setq ebdb-message-auto-update-p 'create)

;;   (setq ebdb-message-try-all-headers t)
;;   (setq ebdb-message-headers
;;         '((sender "From" "Resent-From" "Reply-To" "Sender")
;;           (recipients "Resent-To" "Resent-Cc" "Resent-CC" "To" "Cc" "CC" "Bcc" "BCC")))
;;   (setq ebdb-message-all-addresses t)

;;   (setq ebdb-complete-mail 'capf)
;;   (setq ebdb-mail-avoid-redundancy t)
;;   (setq ebdb-completion-display-record nil)
;;   (setq ebdb-complete-mail-allow-cycling nil)

;;   (setq ebdb-record-self "ace719a4-61f8-4bee-a1ca-2f07e2292305")
;;   (setq ebdb-user-name-address-re 'self) ; match the above
;;   (setq ebdb-save-on-exit t)

;;   (setq ebdb-use-diary nil)

;;   (with-eval-after-load 'prot-mail ; check my `prot-mail.el'
;;     (add-hook 'message-setup-hook #'prot-mail-ebdb-message-setup))

;;   (let ((map ebdb-mode-map))
;;     (define-key map (kbd "D") #'ebdb-delete-field-or-record)
;;     (define-key map (kbd "M") #'ebdb-mail) ; disables `ebdb-mail-each'
;;     (define-key map (kbd "m") #'ebdb-toggle-record-mark)
;;     (define-key map (kbd "t") #'ebdb-toggle-all-record-marks)
;;     (define-key map (kbd "T") #'ebdb-toggle-records-format) ; disables `ebdb-toggle-all-records-format'
;;     (define-key map (kbd "U") #'ebdb-unmark-all-records)))

(prot-emacs-elpa-package 'bongo
  (setq bongo-default-directory "~/Music")
  (setq bongo-prefer-library-buffers nil)
  (setq bongo-insert-whole-directory-trees t)
  (setq bongo-logo nil)
  (setq bongo-display-track-icons nil)
  (setq bongo-display-track-lengths nil)
  (setq bongo-display-header-icons nil)
  (setq bongo-display-playback-mode-indicator t)
  (setq bongo-display-inline-playback-progress nil) ; t slows down the playlist buffer
  (setq bongo-join-inserted-tracks nil)
  (setq bongo-field-separator (propertize " · " 'face 'shadow))
  (setq bongo-mark-played-tracks t)
  (setq bongo-vlc-program-name "cvlc")
  (bongo-mode-line-indicator-mode -1)
  (bongo-header-line-mode -1)
  (let ((map global-map))
    (define-key map (kbd "C-c b") #'bongo)
    (define-key map (kbd "<C-XF86AudioPlay>") #'bongo-pause/resume)
    (define-key map (kbd "<C-XF86AudioNext>") #'bongo-next)
    (define-key map (kbd "<C-XF86AudioPrev>") #'bongo-previous)
    (define-key map (kbd "<C-M-XF86AudioPlay>") #'bongo-play-random)
    (define-key map (kbd "<M-XF86AudioPlay>") #'bongo-show)
    (define-key map (kbd "<S-XF86AudioNext>") #'bongo-seek-forward-10)
    (define-key map (kbd "<S-XF86AudioPrev>") #'bongo-seek-backward-10))
  (let ((map bongo-playlist-mode-map))
    (define-key map (kbd "n") #'bongo-next-object)
    (define-key map (kbd "p") #'bongo-previous-object)
    (define-key map (kbd "R") #'bongo-rename-line)
    (define-key map (kbd "j") #'bongo-dired-line)       ; Jump to dir of file at point
    (define-key map (kbd "J") #'dired-jump)             ; Jump to library buffer
    (define-key map (kbd "I") #'bongo-insert-special)))

(with-eval-after-load 'bongo
  (prot-emacs-builtin-package 'prot-bongo
    (setq prot-bongo-enabled-backends '(mpv vlc))
    (setq prot-bongo-playlist-section-delimiter (make-string 30 ?*))
    (setq prot-bongo-playlist-heading-delimiter "§")
    (setq prot-bongo-playlist-directory
          (concat
           (file-name-as-directory bongo-default-directory)
           (file-name-as-directory "playlists")))
    ;; Those set up a few extras: read each function's doc string.  Pass
    ;; an argument to undo their effects.
    (prot-bongo-enabled-backends)
    (prot-bongo-remove-headers)
    (prot-bongo-imenu-setup)
    (add-hook 'dired-mode-hook #'prot-bongo-dired-library-enable)
    (add-hook 'wdired-mode-hook #'prot-bongo-dired-library-disable)
    (add-hook 'prot-bongo-playlist-change-track-hook #'prot-bongo-playlist-recenter)
    (let ((map bongo-playlist-mode-map))
      (define-key map (kbd "C-c C-n") #'prot-bongo-playlist-heading-next)
      (define-key map (kbd "C-c C-p") #'prot-bongo-playlist-heading-previous)
      (define-key map (kbd "M-n") #'prot-bongo-playlist-section-next)
      (define-key map (kbd "M-p") #'prot-bongo-playlist-section-previous)
      (define-key map (kbd "M-h") #'prot-bongo-playlist-mark-section)
      (define-key map (kbd "M-d") #'prot-bongo-playlist-kill-section)
      (define-key map (kbd "g") #'prot-bongo-playlist-reset)
      (define-key map (kbd "D") #'prot-bongo-playlist-terminate)
      (define-key map (kbd "r") #'prot-bongo-playlist-random-toggle)
      (define-key map (kbd "i") #'prot-bongo-playlist-insert-playlist-file))
    (let ((map bongo-dired-library-mode-map))
      (define-key map (kbd "<C-return>") #'prot-bongo-dired-insert)
      (define-key map (kbd "C-c SPC") #'prot-bongo-dired-insert)
      (define-key map (kbd "C-c +") #'prot-bongo-dired-make-playlist-file))))

(prot-emacs-elpa-package 'elfeed
  (setq elfeed-use-curl t)
  (setq elfeed-curl-max-connections 10)
  (setq elfeed-db-directory (concat user-emacs-directory "elfeed/"))
  (setq elfeed-enclosure-default-dir "~/Downloads/")
  (setq elfeed-search-filter "@4-months-ago +unread")
  (setq elfeed-sort-order 'descending)
  (setq elfeed-search-clipboard-type 'CLIPBOARD)
  (setq elfeed-search-title-max-width 100)
  (setq elfeed-search-title-min-width 30)
  (setq elfeed-search-trailing-width 25)
  (setq elfeed-show-truncate-long-urls t)
  (setq elfeed-show-unique-buffers t)
  (setq elfeed-search-date-format '("%F %R" 16 :left))

  ;; Make sure to also check the section on shr and eww for how I handle
  ;; `shr-width' there.
  (add-hook 'elfeed-show-mode-hook
            (lambda () (setq-local shr-width (current-fill-column))))

  (prot-emacs-builtin-package 'prot-elfeed-bongo)

  (define-key global-map (kbd "C-c e") #'elfeed)
  (let ((map elfeed-search-mode-map))
    (define-key map (kbd "w") #'elfeed-search-yank)
    (define-key map (kbd "g") #'elfeed-update)
    (define-key map (kbd "G") #'elfeed-search-update--force)
    (define-key map (kbd "b") #'prot-elfeed-bongo-insert-item)
    (define-key map (kbd "h") #'prot-elfeed-bongo-switch-to-playlist)) ; "hop" mnemonic
  (let ((map elfeed-show-mode-map))
    (define-key map (kbd "w") #'elfeed-show-yank)
    (define-key map (kbd "b") #'prot-elfeed-bongo-insert-item)))

(with-eval-after-load 'elfeed
  (prot-emacs-builtin-package 'prot-elfeed
    (setq prot-elfeed-tag-faces t)
    (prot-elfeed-fontify-tags)
    (add-hook 'elfeed-search-mode-hook #'prot-elfeed-load-feeds)
    (let ((map elfeed-search-mode-map))
      (define-key map (kbd "s") #'prot-elfeed-search-tag-filter)
      (define-key map (kbd "o") #'prot-elfeed-search-open-other-window)
      (define-key map (kbd "q") #'prot-elfeed-kill-buffer-close-window-dwim)
      (define-key map (kbd "v") #'prot-elfeed-mpv-dwim)
      (define-key map (kbd "+") #'prot-elfeed-toggle-tag))
    (let ((map elfeed-show-mode-map))
      (define-key map (kbd "a") #'prot-elfeed-show-archive-entry)
      (define-key map (kbd "e") #'prot-elfeed-show-eww)
      (define-key map (kbd "q") #'prot-elfeed-kill-buffer-close-window-dwim)
      (define-key map (kbd "v") #'prot-elfeed-mpv-dwim)
      (define-key map (kbd "+") #'prot-elfeed-toggle-tag))))

(prot-emacs-builtin-package 'proced
  (setq proced-auto-update-flag t)
  (setq proced-auto-update-interval 1)
  (setq proced-descend t)
  (setq proced-filter 'user))

(prot-emacs-elpa-package 'password-store
  (setq password-store-time-before-clipboard-restore 30))

(prot-emacs-elpa-package 'pass)

(prot-emacs-builtin-package 'browse-url
  (setq browse-url-browser-function 'eww-browse-url)
  (setq browse-url-secondary-browser-function 'browse-url-default-browser))

(prot-emacs-builtin-package 'shr
  (setq shr-use-colors nil)             ; t is bad for accessibility
  (setq shr-use-fonts nil)              ; t is not for me
  (setq shr-max-image-proportion 0.6)
  (setq shr-image-animate nil)          ; No GIFs, thank you!
  (setq shr-width nil)                  ; check `prot-eww-readable'
  (setq shr-discard-aria-hidden t)
  (setq shr-cookie-policy nil))

(prot-emacs-builtin-package 'eww
  (setq eww-restore-desktop t)
  (setq eww-desktop-remove-duplicates t)
  (setq eww-header-line-format nil)
  (setq eww-search-prefix "https://duckduckgo.com/html/?q=")
  (setq eww-download-directory (expand-file-name "~/Downloads/eww"))
  (setq eww-suggest-uris
        '(eww-links-at-point
          thing-at-point-url-at-point))
  (setq eww-bookmarks-directory (locate-user-emacs-file "eww-bookmarks/"))
  (setq eww-history-limit 150)
  (setq eww-use-external-browser-for-content-type
        "\\`\\(video/\\|audio\\)") ; On GNU/Linux check your mimeapps.list
  (setq eww-browse-url-new-window-is-tab nil)
  (setq eww-form-checkbox-selected-symbol "[X]")
  (setq eww-form-checkbox-symbol "[ ]")
  ;; NOTE `eww-retrieve-command' is for Emacs28.  I tried the following
  ;; two values.  The first would not render properly some plain text
  ;; pages, such as by messing up the spacing between paragraphs.  The
  ;; second is more reliable but feels slower.  So I just use the
  ;; default (nil), though I find wget to be a bit faster.  In that case
  ;; one could live with the occasional errors by using `eww-download'
  ;; on the offending page, but I prefer consistency.
  ;;
  ;; '("wget" "--quiet" "--output-document=-")
  ;; '("chromium" "--headless" "--dump-dom")
  (setq eww-retrieve-command nil)

  (define-key eww-link-keymap (kbd "v") nil) ; stop overriding `eww-view-source'
  (define-key eww-mode-map (kbd "L") #'eww-list-bookmarks)
  (define-key dired-mode-map (kbd "E") #'eww-open-file) ; to render local HTML files
  (define-key eww-buffers-mode-map (kbd "d") #'eww-bookmark-kill)   ; it actually deletes
  (define-key eww-bookmark-mode-map (kbd "d") #'eww-bookmark-kill)) ; same

(prot-emacs-builtin-package 'prot-eww
  (define-prefix-command 'prot-eww-map)
  (define-key global-map (kbd "C-c w") 'prot-eww-map)
  (define-key global-map (kbd "s-w") 'prot-eww-map)
  (let ((map prot-eww-map))
    (define-key map (kbd "b") #'prot-eww-visit-bookmark)
    (define-key map (kbd "e") #'prot-eww-browse-dwim)
    (define-key map (kbd "a") #'prot-eww-search-arch-wiki)
    (define-key map (kbd "A") #'prot-eww-search-arch-aur)
    (define-key map (kbd "d") #'prot-eww-search-debbugs)
    (define-key map (kbd "w") #'prot-eww-search-wikipedia)
    (define-key map (kbd "s") #'prot-eww-search-engine))
  (let ((map eww-mode-map))
    (define-key map (kbd "B") #'prot-eww-bookmark-page)
    (define-key map (kbd "D") #'prot-eww-download-html)
    (define-key map (kbd "F") #'prot-eww-find-feed)
    (define-key map (kbd "b") #'prot-eww-visit-bookmark)
    (define-key map (kbd "e") #'prot-eww-browse-dwim)
    (define-key map (kbd "o") #'prot-eww-open-in-other-window)
    (define-key map (kbd "E") #'prot-eww-visit-url-on-page)
    (define-key map (kbd "J") #'prot-eww-jump-to-url-on-page)
    (define-key map (kbd "R") #'prot-eww-readable)))

(prot-emacs-elpa-package 'pdf-tools
  (setq pdf-tools-enabled-modes         ; simplified from the defaults
        '(pdf-history-minor-mode
          pdf-isearch-minor-mode
          pdf-links-minor-mode
          pdf-outline-minor-mode
          pdf-misc-size-indication-minor-mode
          pdf-occur-global-minor-mode))
  (setq pdf-view-display-size 'fit-height)
  (setq pdf-view-continuous t)
  (setq pdf-view-use-dedicated-register nil)
  (setq pdf-view-max-image-width 1080)
  (setq pdf-outline-imenu-use-flat-menus t)

  (pdf-loader-install)

  ;; Those functions and hooks are adapted from the manual of my
  ;; modus-themes.  The idea is to (i) add a backdrop that is distinct
  ;; from the background of the PDF's page and (ii) make pdf-tools adapt
  ;; to theme switching via, e.g., `modus-themes-toggle'.
  (defun prot/pdf-tools-backdrop ()
    (face-remap-add-relative
     'default
     `(:background ,(modus-themes-color 'bg-alt))))

  (defun prot/pdf-tools-midnight-mode-toggle ()
    (when (derived-mode-p 'pdf-view-mode)
      (if (eq (car custom-enabled-themes) 'modus-vivendi)
          (pdf-view-midnight-minor-mode 1)
        (pdf-view-midnight-minor-mode -1))
      (prot/pdf-tools-backdrop)))

  (add-hook 'pdf-tools-enabled-hook #'prot/pdf-tools-midnight-mode-toggle)
  (add-hook 'modus-themes-after-load-theme-hook #'prot/pdf-tools-midnight-mode-toggle))

(prot-emacs-elpa-package 'beginend
  (beginend-global-mode 1))

(prot-emacs-elpa-package 'goto-last-change
  (define-key global-map (kbd "C-z") #'goto-last-change))

(setq mode-line-percent-position '(-3 "%p"))
(setq mode-line-position-column-line-format '(" %l,%c")) ; Emacs 28
(setq mode-line-defining-kbd-macro
      (propertize " Macro" 'face 'mode-line-emphasis))

;; Thanks to Daniel Mendler for this!  It removes the square brackets
;; that denote recursive edits in the modeline.  I do not need them
;; because I am using Daniel's `recursion-indicator':
;; <https://github.com/minad/recursion-indicator>.
(setq-default mode-line-modes
              (seq-filter (lambda (s)
                            (not (and (stringp s)
                                      (string-match-p
                                       "^\\(%\\[\\|%\\]\\)$" s))))
                          mode-line-modes))

(setq mode-line-compact nil)            ; Emacs 28
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification
                "  "
                mode-line-position
                mode-line-modes
                "  "
                (vc-mode vc-mode)
                "  "
                mode-line-misc-info
                mode-line-end-spaces))

(prot-emacs-elpa-package 'moody)

(prot-emacs-builtin-package 'prot-moody
  ;; Addjust this and then evaluate `prot-moody-set-height'.  Not all
  ;; fonts work equally well with the same value.
  (setq prot-moody-font-height-multiplier 1.35)

  ;; Also check the Modus themes' `modus-themes-mode-line' which can set
  ;; the styles specifically for Moody.
  (prot-moody-set-height -1))

(prot-emacs-elpa-package 'minions
  (setq minions-mode-line-lighter ";")
  ;; NOTE: This will be expanded whenever I find a mode that should not
  ;; be hidden
  (setq minions-direct (list 'defining-kbd-macro
                             'flymake-mode
                             'prot-simple-monocle))
  (minions-mode 1))

(prot-emacs-elpa-package 'recursion-indicator
  (setq recursion-indicator-general "&")
  (setq recursion-indicator-minibuffer "@")
  (recursion-indicator-mode 1))

(prot-emacs-builtin-package 'battery
  (setq battery-mode-line-format " [%b%p%%]")
  (setq battery-mode-line-limit 95)
  (setq battery-update-interval 180)
  (setq battery-load-low 20)
  (setq battery-load-critical 10)
  (add-hook 'after-init-hook #'display-battery-mode))

(prot-emacs-builtin-package 'time
  (setq display-time-format "%H:%M  %Y-%m-%d")
  ;;;; Covered by `display-time-format'
  ;; (setq display-time-24hr-format t)
  ;; (setq display-time-day-and-date t)
  (setq display-time-interval 60)
  (setq display-time-default-load-average nil)
  ;; NOTE 2021-04-19: For all those, I have implemented a custom
  ;; solution that also shows the number of new items.  Refer to my
  ;; email settings, specifically `prot-mail-mail-indicator'.
  ;;
  ;; NOTE 2021-05-16: Or better check `prot-notmuch-mail-indicator'.
  (setq display-time-mail-directory nil)
  (setq display-time-mail-function nil)
  (setq display-time-use-mail-icon nil)
  (setq display-time-mail-string nil)
  (setq display-time-mail-face nil)

;;; World clock
  (setq zoneinfo-style-world-list
        '(("America/Los_Angeles" "Los Angeles")
          ("America/Chicago" "Chicago")
          ("America/New_York" "New York")
          ("Europe/Lisbon" "Lisbon")
          ("Europe/Brussels" "Brussels")
          ("Asia/Shanghai" "Shanghai")
          ("Asia/Tokyo" "Tokyo")))

  ;; All of the following variables are for Emacs 28
  (setq world-clock-list t)
  (setq world-clock-time-format "%R %z  %A %d %B")
  (setq world-clock-buffer-name "*world-clock*") ; Placement handled by `display-buffer-alist'
  (setq world-clock-timer-enable t)
  (setq world-clock-timer-second 60)

  (add-hook 'after-init-hook #'display-time-mode))

(prot-emacs-elpa-package 'keycast
  ;; Those are for `keycast-mode'
  (setq keycast-window-predicate 'moody-window-active-p) ; assumes `moody.el'
  (setq keycast-separator-width 1)
  (setq keycast-remove-tail-elements nil)

  (dolist (input '(self-insert-command
                   org-self-insert-command))
    (add-to-list 'keycast-substitute-alist `(,input "." "Typing…")))

  (dolist (event '(mouse-event-p
                   mouse-movement-p
                   mwheel-scroll))
    (add-to-list 'keycast-substitute-alist `(,event nil)))

  ;; Those are for the `keycast-log-mode'
  (setq keycast-log-format "%-20K%C\n")
  (setq keycast-log-frame-alist
        '((minibuffer . nil)))
  (setq keycast-log-newest-first t)

  ;; Specify `keycast-insert-after' buffer identification.  This make it
  ;; possible to seamlessly toggle `prot-moody-set-height' without
  ;; disrupting keycast.
  (with-eval-after-load 'prot-moody
    (add-hook 'prot-moody-set-height-hook #'prot-moody-keycast-insert-after)))

(setq window-divider-default-right-width 1)
(setq window-divider-default-bottom-width 1)
(setq window-divider-default-places 'right-only)
(add-hook 'after-init-hook #'window-divider-mode)

(prot-emacs-builtin-package 'fringe
  (fringe-mode nil)
  (setq-default fringes-outside-margins nil)
  (setq-default indicate-buffer-boundaries nil)
  (setq-default indicate-empty-lines nil)
  (setq-default overflow-newline-into-fringe t))

(prot-emacs-elpa-package 'ct)

(prot-emacs-elpa-package 'rainbow-mode
  (setq rainbow-ansi-colors nil)
  (setq rainbow-x-colors nil))

(prot-emacs-builtin-package 'prot-sideline
  (require 'display-line-numbers)
  ;; Set absolute line numbers.  A value of "relative" is also useful.
  (setq display-line-numbers-type t)
  ;; Those two variables were introduced in Emacs 27.1
  (setq display-line-numbers-major-tick 0)
  (setq display-line-numbers-minor-tick 0)
  ;; Use absolute numbers in narrowed buffers
  (setq-default display-line-numbers-widen t)

  (prot-emacs-elpa-package 'diff-hl
    (setq diff-hl-draw-borders nil)
    (setq diff-hl-side 'left))

  (require 'hl-line)
  (setq hl-line-sticky-flag nil)

  (require 'whitespace)

  (let ((map global-map))
    (define-key map (kbd "<f6>") #'prot-sideline-negative-space-toggle)
    (define-key map (kbd "<f7>") #'prot-sideline-mode)
    (define-key map (kbd "C-c z") #'delete-trailing-whitespace)))

(prot-emacs-builtin-package 'outline
  (setq-default outline-minor-mode-highlight 'override) ; emacs28
  (setq-default outline-minor-mode-cycle t)     ; emacs28
  (let ((map outline-minor-mode-map))
    (define-key map (kbd "C-<tab>") #'outline-cycle)
    (define-key map (kbd "<backtab>") #'outline-cycle-buffer) ; S-TAB
    (define-key map (kbd "C-c C-n") #'outline-next-visible-heading)
    (define-key map (kbd "C-c C-p") #'outline-previous-visible-heading)
    (define-key map (kbd "C-c C-f") #'outline-forward-same-level)
    (define-key map (kbd "C-c C-b") #'outline-backward-same-level)
    (define-key map (kbd "C-c C-a") #'outline-show-all)
    (define-key map (kbd "C-c C-o") #'outline-hide-other)
    (define-key map (kbd "C-c C-u") #'outline-up-heading)))

(prot-emacs-builtin-package 'prot-outline
  (let ((map outline-minor-mode-map))
    (define-key map (kbd "C-c C-v") #'prot-outline-move-major-heading-down)
    (define-key map (kbd "M-<down>") #'prot-outline-move-major-heading-down)
    (define-key map (kbd "C-c M-v") #'prot-outline-move-major-heading-up)
    (define-key map (kbd "M-<up>") #'prot-outline-move-major-heading-up)
    (define-key map (kbd "C-x n s") #'prot-outline-narrow-to-subtree))
  (define-key global-map (kbd "<f10>") #'prot-outline-minor-mode-safe))

;; (prot-emacs-builtin-package 'prot-cursor
;;   (prot-cursor-presentation-mode -1))

(prot-emacs-builtin-package 'mouse
  ;; In Emacs 27+, use Control + mouse wheel to scale text.
  (setq mouse-wheel-scroll-amount
        '(1
          ((shift) . 5)
          ((meta) . 0.5)
          ((control) . text-scale)))
  (setq mouse-drag-copy-region nil)
  (setq make-pointer-invisible t)
  (setq mouse-wheel-progressive-speed t)
  (setq mouse-wheel-follow-mouse t)
  (add-hook 'after-init-hook #'mouse-wheel-mode)
  (define-key global-map (kbd "C-M-<mouse-3>") #'tear-off-window))

(setq-default scroll-preserve-screen-position t)
(setq-default scroll-conservatively 1) ; affects `scroll-step'
(setq-default scroll-margin 0)
(setq-default next-screen-context-lines 0)

(prot-emacs-builtin-package 'delsel
  (add-hook 'after-init-hook #'delete-selection-mode))

(prot-emacs-builtin-package 'tooltip
  (setq tooltip-delay 0.5)
  (setq tooltip-short-delay 0.5)
  (setq x-gtk-use-system-tooltips nil)
  (setq tooltip-frame-parameters
        '((name . "tooltip")
          (internal-border-width . 6)
          (border-width . 0)
          (no-special-glyphs . t)))
  (add-hook 'after-init-hook #'tooltip-mode))

;; Project repo: <https://gitlab.com/mmemmew/rlist>.  This is one of the
;; packages I handle manually via git, at least until it becomes
;; available through an ELPA.
;;
;; `prot-emacs-manual-package' is defined in my init.el
(prot-emacs-manual-package 'rlist
  (setq rlist-expert t)
  (setq rlist-verbose t)
  (let ((map global-map))
    (define-key map (kbd "C-x r <backspace>") #'rlist-list-registers)
    (define-key map (kbd "C-x r <delete>") #'rlist-list-registers)))

(prot-emacs-builtin-package 'time-stamp
  (add-hook 'before-save-hook #'time-stamp))

(prot-emacs-builtin-package 'autorevert
  (setq auto-revert-verbose t)
  (add-hook 'after-init-hook #'global-auto-revert-mode))

(setq save-interprogram-paste-before-kill t)

(prot-emacs-elpa-package 'goggles
  (setq-default goggles-pulse t)
  (dolist (mode '(prog-mode-hook text-mode-hook))
    (add-hook mode #'goggles-mode)))

(setq mode-require-final-newline 'visit-save)

(setq repeat-on-final-keystroke t)
(setq set-mark-command-repeat-pop t)
(define-key global-map (kbd "M-z") #'zap-up-to-char)
(define-key global-map (kbd "s-z") #'repeat)

(prot-emacs-builtin-package 'package
  ;; All variables are for Emacs 28+
  (setq package-name-column-width 40)
  (setq package-version-column-width 14)
  (setq package-status-column-width 12)
  (setq package-archive-column-width 8)
  (add-hook 'package-menu-mode-hook #'hl-line-mode))

(prot-emacs-builtin-package 'text-mode)

(prot-emacs-builtin-package 'prot-text
  (add-to-list 'auto-mode-alist '("\\(README\\|CHANGELOG\\|COPYING\\|LICENSE\\)$" . text-mode))
  (define-key text-mode-map (kbd "<M-return>") #'prot-text-insert-heading)
  (define-key org-mode-map (kbd "M-;") nil))

(prot-emacs-elpa-package 'markdown-mode
  (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
  (setq markdown-fontify-code-blocks-natively t))
;; Allows for fenced block focus with C-c ' (same as Org blocks).
(prot-emacs-elpa-package 'edit-indirect)

(prot-emacs-elpa-package 'yaml-mode
  (add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode)))

(prot-emacs-builtin-package 'css-mode
  (add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
  (add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))
  (setq css-fontify-colors nil))

(prot-emacs-builtin-package 'sh-script
  (add-to-list 'auto-mode-alist '("PKGBUILD" . sh-mode)))

(prot-emacs-builtin-package 'prot-fill
  (setq prot-fill-default-column 72)
  (setq prot-fill-prog-mode-column 72)  ; Set this to another value if you want
  ;; Those variables come from various sources, though they feel part of the
  ;; same conceptual framework.
  (setq sentence-end-double-space t)
  (setq sentence-end-without-period nil)
  (setq colon-double-space nil)
  (setq use-hard-newlines nil)
  (setq adaptive-fill-mode t)
  (prot-fill-fill-mode 1)
  (add-hook 'after-init-hook #'column-number-mode))

(prot-emacs-builtin-package 'newcomment
  (setq comment-empty-lines t)
  (setq comment-fill-column nil)
  (setq comment-multi-line t)
  (setq comment-style 'multi-line)
  (let ((map global-map))
    (define-key map (kbd "C-:") #'comment-kill)         ; C-S-;
    (define-key map (kbd "M-;") #'comment-indent)))

(prot-emacs-builtin-package 'prot-comment
  (setq prot-comment-comment-keywords
        '("TODO" "NOTE" "XXX" "REVIEW" "FIXME"))
  (let ((map global-map))
    (define-key map (kbd "C-;") #'prot-comment-comment-dwim)
    (define-key map (kbd "C-x C-;") #'prot-comment-timestamp-keyword)))

(prot-emacs-builtin-package 'electric
  (setq electric-pair-inhibit-predicate'electric-pair-conservative-inhibit)
  (setq electric-pair-preserve-balance t)
  (setq electric-pair-pairs
        '((8216 . 8217)
          (8220 . 8221)
          (171 . 187)))
  (setq electric-pair-skip-self 'electric-pair-default-skip-self)
  (setq electric-pair-skip-whitespace nil)
  (setq electric-pair-skip-whitespace-chars
        '(9
          10
          32))
  (setq electric-quote-context-sensitive t)
  (setq electric-quote-paragraph t)
  (setq electric-quote-string nil)
  (setq electric-quote-replace-double t)
  (electric-indent-mode 1)
  (electric-pair-mode -1)
  (electric-quote-mode -1))

(prot-emacs-builtin-package 'paren
  (setq show-paren-style 'parenthesis)
  (setq show-paren-when-point-in-periphery nil)
  (setq show-paren-when-point-inside-paren nil)
  (add-hook 'after-init-hook #'show-paren-mode))

(setq-default tab-always-indent 'complete)
(setq-default tab-first-completion 'word-or-paren-or-punct) ; Emacs 27
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(prot-emacs-builtin-package 'flyspell
  (setq flyspell-issue-message-flag nil)
  (setq flyspell-issue-welcome-flag nil)
  (setq ispell-program-name "aspell")
  (setq ispell-dictionary "en_GB")
  (define-key flyspell-mode-map (kbd "C-;") nil))

(prot-emacs-builtin-package 'prot-spell
  (setq prot-spell-dictionaries
        '(("EN English" . "en")
          ("EL Ελληνικά" . "el")
          ("FR Français" . "fr")
          ("ES Espanõl" . "es")))
  (let ((map global-map))
    (define-key map (kbd "M-$") #'prot-spell-spell-dwim)
    (define-key map (kbd "C-M-$") #'prot-spell-change-dictionary)))

(prot-emacs-builtin-package 'flymake
  (setq flymake-fringe-indicator-position 'left-fringe)
  (setq flymake-suppress-zero-counters t)
  (setq flymake-start-on-flymake-mode t)
  (setq flymake-no-changes-timeout nil)
  (setq flymake-start-on-save-buffer t)
  (setq flymake-proc-compilation-prevents-syntax-check t)
  (setq flymake-wrap-around nil)
  (let ((map flymake-mode-map))
    (define-key map (kbd "C-c ! s") #'flymake-start)
    (define-key map (kbd "C-c ! d") #'flymake-show-diagnostics-buffer)
    (define-key map (kbd "C-c ! n") #'flymake-goto-next-error)
    (define-key map (kbd "C-c ! p") #'flymake-goto-prev-error)))

(prot-emacs-elpa-package 'flymake-diagnostic-at-point
  (setq flymake-diagnostic-at-point-display-diagnostic-function
        'flymake-diagnostic-at-point-display-minibuffer))

(prot-emacs-elpa-package 'flymake-proselint
  (add-hook 'markdown-mode-hook #'flymake-proselint-setup)
  (add-hook 'org-mode-hook #'flymake-proselint-setup)
  (add-hook 'text-mode-hook #'flymake-proselint-setup))

(prot-emacs-elpa-package 'package-lint-flymake
  (add-hook 'flymake-diagnostic-functions #'package-lint-flymake))

(prot-emacs-builtin-package 'eldoc
  (global-eldoc-mode 1))

(prot-emacs-builtin-package 'man
  (let ((map Man-mode-map))
    (define-key map (kbd "i") #'Man-goto-section)
    (define-key map (kbd "g") #'Man-update-manpage)))

(prot-emacs-builtin-package 'server
  (add-hook 'after-init-hook #'server-start))

;; TODO when uncommented the desktop files get saved but not read (tells already loaded)
 (prot-emacs-builtin-package 'desktop
;;   (setq desktop-auto-save-timeout 300)
;;   (setq desktop-path `(,user-emacs-directory))
;;   (setq desktop-base-file-name "desktop")
;;   (setq desktop-files-not-to-save nil)
;;   (setq desktop-globals-to-clear nil)
   (setq desktop-load-locked-desktop t)
   (setq desktop-missing-file-warning nil)
;;   (setq desktop-restore-eager 0)
;;   (setq desktop-restore-frames nil)
  (setq desktop-save 'ask-if-new)
  (dolist (symbol '(kill-ring log-edit-comment-ring))
    (add-to-list 'desktop-globals-to-save symbol))

   (desktop-save-mode 1))

(prot-emacs-builtin-package 'savehist
  (setq savehist-file (locate-user-emacs-file "savehist"))
  (setq history-length 10000)
  (setq history-delete-duplicates t)
  (setq savehist-save-minibuffer-history t)
  (add-hook 'after-init-hook #'savehist-mode))

(prot-emacs-builtin-package 'saveplace
  (setq save-place-file (locate-user-emacs-file "saveplace"))
  (setq save-place-forget-unreadable-files t)
  (save-place-mode 1))

(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backup/"))))
(setq backup-by-copying t)
(setq version-control t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq create-lockfiles nil)
