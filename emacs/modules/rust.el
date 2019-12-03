(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :hook(rust-mode . (lambda () (eglot-ensure))))
