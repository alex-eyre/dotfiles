(use-package auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
  :after cdlatex
  :init (progn
          (require 'texmathp)
          (setq TeX-auto-save t
                TeX-parse-self t))
  :hook
  (LaTeX-mode-hook . (lambda ()
		      (LaTeX-math-mode 1)
		      (TeX-fold-mode 1)
		      (TeX-PDF-mode 1)
		      (turn-on-cdlatex)
		      (outline-minor-mode 1))))

(use-package cdlatex
  :straight(:type git :host github :repo "cdominik/cdlatex")
  :commands(LaTeX-mode))
