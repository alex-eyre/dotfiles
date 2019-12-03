(use-package fsharp-mode
  :hook(fsharp-mode . (lambda () (eglot-ensure))))
