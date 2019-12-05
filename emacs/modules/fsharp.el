(use-package fsharp-mode
  :after flycheck
  :hook(fsharp-mode . (lambda () (eglot-ensure))))
