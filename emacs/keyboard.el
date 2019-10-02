(use-package evil
  :demand t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  :init(evil-mode 1))

(use-package evil-collection
  :after evil
  :demand t
  :config(evil-collection-init))

(use-package evil-leader
  :demand t
  :after evil
  :init(global-evil-leader-mode)
  :config
  (evil-leader/set-key
    "p" 'projectile-switch-project
    "o" 'projectile-find-file
    "O" 'projectile-find-file-other-frame
    "i" 'yas-insert-snippet))

