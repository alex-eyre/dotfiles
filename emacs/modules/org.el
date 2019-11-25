(use-package sublimity
  :straight(sublimity :type git :host github :repo "zk-phi/sublimity")
  :straight(sublimity-attractive :type git :host github :repo "zk-phi/sublimity")
  :config
  (require 'sublimity)
  (require 'sublimity-attractive)
  :hook
  (org-mode . (lambda () (sublimity-mode 1)))
  (prog-mode . (lambda () (sublimity-mode 0))))
					 
  
(use-package org
  :straight(org :type built-in)
  :straight spacemacs-theme
  :config
  (set-face-attribute 'org-table nil
			     :height 0.9)
  (setq org-startup-indented t
	org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
	org-ellipsis "  " ;; folding symbol
	org-pretty-entities t
	org-hide-emphasis-markers t
	;; show actually italicized text instead of /italicized text/
	org-agenda-block-separator ""
	org-fontify-whole-heading-line t
	org-fontify-done-headline t
	org-fontify-quote-and-verse-blocks t)
  :hook
  (org-mode . (lambda () (progn
			   (linum-mode 0)
			   (load-theme 'doom-one-light t)
			   (doom-themes-org-config)
			   (do-margins t)
			   (setq line-spacing 0.1
				 header-line-format " "))))
  (prog-mode . (lambda () (progn
			   (load-theme 'doom-Iosvkem t)
			   (doom-themes-org-config)
			   (do-margins nil)
			    (setq line-spacing nil
				  header-line-format nil))))
  (org-mode . hide-mode-line-mode)
  (org-mode . visual-line-mode))

(use-package mixed-pitch
  :straight(mixed-pitch :type git :host gitlab :repo "jabranham/mixed-pitch")
  :hook(org-mode . mixed-pitch-mode))

(use-package org-pretty-table
  :disabled t ;; cannot get it to play nicely with variable-pitch or mixed-pitch
  :straight(org-pretty-table :type git :host github :repo "Fuco1/org-pretty-table")
  :hook(org-mode . org-pretty-table-mode))

(use-package org-bullets
  :straight(org-bullets :type git :host github :repo "sabof/org-bullets"
			:fork (:host github
				     :repo "alex-eyre/org-bullets"))
  :hook(org-mode . org-bullets-mode))

(defun do-margins (on)
  (if on
	  (setq left-margin-width 2
		right-margin-width 2)
    (setq left-margin-width 0
	  right-margin-width 0))
  (set-window-buffer nil (current-buffer)))
