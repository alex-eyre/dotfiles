(use-package csharp-mode
  :mode ("\\.cs\\'" . csharp-mode))
(use-package omnisharp
  :after csharp-mode
  :after company
  :mode ("\\.cs\\'" . omnisharp-mode)
  :config(add-to-list 'company-backends 'company-omnisharp)
  :hook
  (csharp-mode . omnisharp-mode))
