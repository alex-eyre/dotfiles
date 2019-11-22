(use-package evil
  :init(evil-mode 1))

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
