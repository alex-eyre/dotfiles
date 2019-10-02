(use-package ahk-mode)
(use-package rust-mode)
(use-package htmlize)
(use-package auctex
  :defer t
  :demand t)
(use-package cdlatex
  :hook(org-mode-hook . 'org-cdlatex-mode))
