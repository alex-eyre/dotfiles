(use-package projectile
  :straight projectile
  :straight ripgrep
  :hook(after-init . (lambda () (projectile-discover-projects-in-search-path)))
  :config
  (setq projectile-completion-system 'ivy
	projectile-project-search-path '("~/projects")
	projectile-indexing-method 'alien))

(use-package counsel-projectile
  :after projectile
  :commands(counsel-projectile
	    counsel-projectile-switch-project
	    counsel-projectile-find-file))

