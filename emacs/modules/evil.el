(use-package evil
  :config
  (evil-ex-define-cmd "q" 'kill-this-buffer)
  (evil-ex-define-cmd "quit" 'evil-quit)
  (evil-ex-define-cmd "cou[nt]" 'count-words-region)
  (global-set-key (kbd "C-x l") 'evil-window-right)
  (global-set-key (kbd "C-x h") 'evil-window-left)
  (global-set-key (kbd "C-x C-l") 'evil-window-increase-width)
  (global-set-key (kbd "C-x C-h") 'evil-window-decrease-width)
  :init
  (setq evil-want-keybinding nil)
  :hook(after-init . evil-mode))

(defun find-note ()
  "Runs projectile on my notes"
  (interactive)
  (projectile-find-file-in-directory "~/notes"))

(use-package evil-leader
  :after evil
  :init(global-evil-leader-mode)
  :config
  (evil-leader/set-key
    "p" 'projectile-switch-project
    "o" 'projectile-find-file
    "O" 'projectile-find-file-other-frame
    "i" 'yas-insert-snippet
    "q" 'projectile-ripgrep
    "'" 'find-note))

(use-package evil-collection
  :after evil
  :init(evil-collection-init))
(use-package evil-snipe
  :defer 2
  :hook
  (evil-mode . (lambda () (evil-snipe-mode +1)))
  :config
  (push 'magit-mode evil-snipe-disabled-modes))
  
