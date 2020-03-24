(use-package flycheck
  :hook(prog-mode . flycheck-mode))
(use-package flycheck-rust
  :after flycheck
  :hook(flycheck-mode . (lambda () (flycheck-rust-setup))))
(use-package flycheck-inline
  :after flycheck
  :hook(flycheck-mode . flycheck-inline-mode))
