(use-package org
  :straight(org :type built-in)
  :config(set-face-attribute 'org-table nil
			     :height 0.9)
  :hook
  (org-mode . hide-mode-line-mode))

(use-package mixed-pitch
  :straight(mixed-pitch :type git :host gitlab :repo "jabranham/mixed-pitch")
  :hook(org-mode . mixed-pitch-mode))

(use-package org-pretty-table
  :disabled t ;; cannot get it to play nicely with variable-pitch or mixed-pitch
  :straight(org-pretty-table :type git :host github :repo "Fuco1/org-pretty-table")
  :hook(org-mode . org-pretty-table-mode))

