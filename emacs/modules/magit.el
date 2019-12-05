(use-package evil-magit
  :after magit
  :init(evil-magit-init))
(use-package magit
  :config(evil-leader/set-key
	 "m" 'magit))
