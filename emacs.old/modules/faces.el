(use-package fonts
  :no-require
  :straight nil
  :after org
  :config
  (set-face-attribute 'variable-pitch nil 
		      :family "Tinos"
		      :height 1.0
		      :background nil)
  (set-face-attribute 'org-document-title nil
		       :inherit 'variable-pitch
		       :height 2.0)
  (set-face-attribute 'org-level-1 nil
		      :inherit 'variable-pitch
		      :height 1.4)
  (set-face-attribute 'org-level-2 nil
		      :inherit 'variable-pitch
		      :height 1.3)
  (set-face-attribute 'org-level-3 nil
		      :inherit 'variable-pitch
		      :height 1.2)
  (set-face-attribute 'org-level-5 nil
		      :inherit 'variable-pitch
		      :height 1.1)
  (set-face-attribute 'org-level-6 nil
		      :inherit 'variable-pitch
		      :height 1.0)
  (set-face-attribute 'org-level-7 nil
		      :inherit 'variable-pitch
		      :height 1.0)
  (set-face-attribute 'org-level-8 nil
		      :inherit 'variable-pitch
		      :height 1.0)
  (set-face-attribute 'fringe nil
		      :background nil))
