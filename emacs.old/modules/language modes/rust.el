(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode))
(use-package racer
  :after rust-mode
  :hook(rust-mode . racer-mode)
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (add-to-list 'company-backends 'company-racer))

