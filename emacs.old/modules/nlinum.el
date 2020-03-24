(defun display-line-numbers/relative ()
  "Relative"
  (interactive)
  (when (not (eq major-mode 'org-mode))
    (menu-bar--display-line-numbers-mode-relative)))

(defun display-line-numbers/absolute ()
  "Absolute"
  (interactive)
  (when (not (eq major-mode 'org-mode))
    (menu-bar--display-line-numbers-mode-absolute)))
(use-package display-line-numbers
  :hook
  (evil-insert-state-exit . (lambda () (display-line-numbers/relative)))
  (evil-insert-state-entry . (lambda () (display-line-numbers/absolute)))
  (prog-mode . display-line-numbers-mode)
  (org-mode . (lambda () (display-line-numbers-mode -1))))
