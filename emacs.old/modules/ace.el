(use-package ace-window
  :config
  (setq aw-keys '(?a ?o ?e ?u ?i ?d ?h ?t ?n)
	aw-ignore-on t
	aw-ignored-buffers '(neotree-mode))
  :bind("C-x o" . ace-window)
  :commands(ace-window))
  
