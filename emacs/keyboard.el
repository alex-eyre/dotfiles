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

(defun setup-input-decode-map ()
  (define-key input-decode-map (kbd "C-a") (kbd "C-x"))
  (define-key input-decode-map (kbd "M-a") (kbd "M-x")))

(setup-input-decode-map)

(add-hook 'tty-setup-hook #'setup-input-decode-map)
