(use-package projectile
  :hook(after-init . (lambda () (projectile-discover-projects-in-search-path)))
  :config
  (setq projectile-completion-system 'ivy
	projectile-project-search-path '("~/projects")
	projectile-indexing-method 'alien))

