(use-package eterm-256color
  :disabled t
  :straight(:type git :host github :repo "dieggsy/eterm-256color")
  :hook(term-mode . eterm-256color-mode))
