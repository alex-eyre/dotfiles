(use-package fsharp-mode
  :disabled t ; was taking _ages_ to load
  :modes ("\\.fs\\'" . fsharp-mode)
  :after flycheck
  :hook(fsharp-mode . (lambda () (eglot-ensure))))
