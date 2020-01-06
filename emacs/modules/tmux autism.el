(defun setup-input-decode-map ()
  (define-key input-decode-map (kbd "C-a") (kbd "C-x"))
  (define-key input-decode-map (kbd "M-a") (kbd "M-x")))
(setup-input-decode-map)
(global-set-key (kbd "C-x |") (lambda () (interactive)(split-window-horizontally) (other-window 1)))
(global-set-key (kbd "C-x _") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-x \\") (lambda () (interactive)(split-window-horizontally) (other-window 1)))
(global-set-key (kbd "C-x -") (lambda () (interactive)(split-window-vertically) (other-window 1)))

