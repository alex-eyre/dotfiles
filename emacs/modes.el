(use-package ahk-mode)
(use-package rust-mode)
(use-package htmlize)

(setq bidi-paragraph-direction 'right-to-left)

(use-package web-mode
  :hook(html-mode . web-mode))
(global-whitespace-mode 1)
(use-package flyspell
  :hook(text-mode . flyspell-mode))
(cond
 ;; try hunspell at first
  ;; if hunspell does NOT exist, use aspell
 ((executable-find "hunspell")
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  (setq ispell-local-dictionary-alist
        ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters passed to hunspell
        ;; You could use `("-d" "en_US,en_US-med")` to check with multiple dictionaries
        '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8))))

 
 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  ;; Please note ispell-extra-args contains ACTUAL parameters passed to aspell
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))))



(use-package markdown-mode)
(use-package auctex
  :defer t)

(use-package company
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default)
  :hook(prog-mode . company-mode))
(use-package company-posframe
  :hook(company-mode . company-posframe-mode))

(defun evil-ex-define-cmd-local
    (cmd function)
  "Locally binds the function FUNCTION to the command CMD."
  (unless (local-variable-p 'evil-ex-commands)
    (setq-local evil-ex-commands (copy-alist evil-ex-commands)))
  (evil-ex-define-cmd cmd function))

(use-package jedi
  :after evil
  :config(setq python-environment-virtualenv
	(append python-environment-virtualenv
		'("--python" "$HOME/.pyenv/shims/python3.7")))
  :hook
  (python-mode . jedi-mode)
  (python-mode . (lambda () (evil-ex-define-cmd-local "goto" #'jedi:goto-definition))))

(use-package dumb-jump
  :after evil	     
  :hook
  (prog-mode . dumb-jump-mode)
  (prog-mode . (lambda () (evil-ex-define-cmd-local "goto" #'dumb-jump-go))))

(use-package company-jedi
  :after(company))

(use-package org-jira
  :config(setq jiralib-url "https://issues.cambridgeconsultants.com"))

(use-package cdlatex
  :hook(org-mode . org-cdlatex-mode))

(use-package evil-org
  :after org
  :hook(org . evil-org-mode))

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(use-package mixed-pitch
  :after org
  :defer t
  :hook(text-mode . mixed-pitch-mode))

(use-package org-bullets
  :after org
  :defer t
  :hook(org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙"))
  (set-fontset-font "fontset-default" nil (font-spec :size 10 :name "Symbola")))

(let* ((variable-tuple
        (cond ((x-list-fonts "Libre Baskerville") '(:font "Libre Baskerville"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.05))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.1))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.15))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.2 :underline t))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 1.25 :underline t))))))

(push '("[ ]" .  "☐") prettify-symbols-alist)
(push '("[X]" . "☑" ) prettify-symbols-alist)
(push '("[-]" . "❍" ) prettify-symbols-alist)
(use-package org
  :defer t
  :hook
  (text-mode . fira-code-mode)
  (prog-mode . fira-code-mode)
  (org-mode . visual-line-mode)
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
  (setq org-projectile-file "notes.org")
  (evil-ex-define-cmd "frt" 'org-toggle-latex-fragment)
  (evil-ex-define-cmd "html" 'org-html-export-to-html))

(use-package org-projectile
  :config(org-projectile-per-project)
  :init(with-eval-after-load 'org-agenda
  (require 'org-projectile)
  (mapcar '(lambda (file)
                 (when (file-exists-p file)
                   (push file org-agenda-files)))
          (org-projectile-todo-files))) )

(custom-theme-set-faces
 'user
 '(org-block                 ((t (:inherit fixed-pitch))))
 '(org-document-info         ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-link                  ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value        ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent                ((t (:inherit (org-hide fixed-pitch))))))
