(use-package doom-themes
  :demand t
  :config(setq nlinum-highlight-current-line t)
  :init
  (load-theme 'doom-Iosvkem t)
  (doom-themes-neotree-config)
  (doom-themes-org-config))
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)
(use-package evil-magit
  :straight magit
  :demand magit
  :after magit
  :init(evil-magit-init))

(use-package projectile
  :config
  (setq projectile-enable-caching nil)
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/projects"))
  :hook(after-init . projectile-mode))

(use-package projectile-ripgrep
  :after projectile)

(use-package neotree
  :after doom-themes
;;  :hook(after-init . neotree-show)
  :bind("C-x l" . neotree-toggle))

;; Emacs 27+ tabs!
(use-package tab-line
  :config
  (setq tab-bar-new-button nil)
  :bind
  (:map evil-normal-state-map
	("g t" . tab-next)
	("g T" . tab-previous)))

(use-package ivy
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode))
(use-package counsel
  :defer t
  :config(counsel-mode))

  

(use-package nlinum-relative
  :init
  (nlinum-relative-setup-evil)
  :hook
  (prog-mode . nlinum-relative-mode))

(use-package nlinum
  :config
  (add-hook 'prog-mode-hook 'nlinum-mode)
  (add-hook 'evil-insert-state-exit-hook 'nlinum-relative-mode))

(use-package doom-modeline
  :config
  (setq inhibit-compacting-font-caches t)
  (setq find-file-visit-truename t)
  :hook (after-init . doom-modeline-mode))

(add-to-list 'default-frame-alist
       '(font . "FiraCode Nerd Font-12"))
(custom-theme-set-faces
 'user
 '(fixed-pitch ((t ( :family "FiraCode Nerd Font" :slant normal :weight normal :height 1.0 :width normal)))))
