(use-package fsharp-mode
  :disabled t ; was taking _ages_ to load
  :after flycheck
  :hook(fsharp-mode . (lambda () (eglot-ensure))))
