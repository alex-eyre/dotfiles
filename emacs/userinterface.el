(setq spacemacs-theme-org-agenda-height nil)
(setq spacemacs-theme-org-height nil)
(straight-use-package
 '(spacemacs-theme :type git :flavor melpa :host github :repo "nashamri/spacemacs-theme"
		   :fork (:host github
				:repo "alex-eyre/spacemacs-theme")))
(load-theme 'spacemacs-dark t)


(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)
(use-package magit)
(use-package evil-magit
  :init(evil-magit-init))

(use-package projectile
  :config
  (setq projectile-enable-caching nil)
  (setq projectile-indexing-method 'alien)
  (setq projectile-completion-system 'ivy)
  (setq projectile-project-search-path '("~/projects"))
  :hook(after-init . projectile-mode))

(use-package dired-sidebar
  :bind
  ("C-x l" . dired-sidebar-toggle-sidebar)
  :commands(dired-sidebar-toggle-sidebar)
  :hook
  (after-init . dired-sidebar-show-sidebar)
  :config
  (evil-ex-define-cmd "swi[tchtosidebar]" 'dired-sidebar-jump-to-sidebar)
  (setq dired-sidebar-use-custom-font t)
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-theme 'all-the-icons))

(use-package centaur-tabs
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (term-mode . centaur-tabs-local-mode)
  (calendar-mode . centaur-tabs-local-mode)
  (org-agenda-mode . centaur-tabs-local-mode)
  (helpful-mode . centaur-tabs-local-mode)
  :config
  (defun centaur-tabs-hide-tab (x)
    (let ((name (format "%s" x)))
      (or
       (string-prefix-p "*epc" name)
       (string-prefix-p "*helm" name)
       (string-prefix-p "*ivy" name)
       (string-prefix-p "*Compile-Log*" name)
       (string-prefix-p "*lsp" name)
       (string-prefix-p "dired-sidebar*" name)
       (and (string-prefix-p "magit" name)
	    (not (file-name-extension name)))
       )))
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-cycle-scope 'tabs)
  (centaur-tabs-group-by-projectile-project)
  :bind
  ("C-<prior>" . centaur-tabs-backward-group)
  ("C-<next>" . centaur-tabs-forward-group)
  (:map evil-normal-state-map
	("g t" . centaur-tabs-forward)
	("g T" . centaur-tabs-backward)))
(use-package ivy
  :hook(after-init . ivy-mode))

  

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
       '(font . "FiraCode Nerd Font-14"))
(custom-theme-set-faces
 'user
 '(fixed-pitch ((t ( :family "FiraCode Nerd Font" :slant normal :weight normal :height 1.0 :width normal)))))
