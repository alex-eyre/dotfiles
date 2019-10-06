(use-package yasnippet-snippets)
(straight-use-package
 '(yasnippets-orgmode :type git :host github :repo "yyr/yasnippets-orgmode"))

(use-package yasnippet
  :demand t
  :init(yas-global-mode 1))
