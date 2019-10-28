(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  :config(evil-mode))

(use-package evil-collection
  :after evil
  :init(evil-collection-init))

(use-package evil-leader
  :after evil
  :init(global-evil-leader-mode)
  :config
  (evil-leader/set-key
    "p" 'projectile-switch-project
    "o" 'projectile-find-file
    "O" 'projectile-find-file-other-frame
    "i" 'yas-insert-snippet
    "q" 'projectile-ripgrep))

