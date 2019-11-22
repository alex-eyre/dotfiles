(use-package yasnippet-snippets)
(straight-use-package
 '(yasnippets-orgmode :type git :host github :repo "yyr/yasnippets-orgmode"))

(use-package yasnippet
  :hook(prog-mode . yas-minor-mode))
