(use-package company
  :hook(prog-mode . company-mode)
  :config(setq company-idle-delay 0
	       company-minimum-prefix-length 1
	       company-selection-wrap-around t))
