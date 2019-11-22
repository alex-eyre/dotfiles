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
