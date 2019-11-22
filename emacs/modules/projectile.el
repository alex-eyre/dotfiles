(use-package projectile
  :hook(after-init . projectile-mode)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/projects")))
