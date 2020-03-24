(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
      (funcall (cdr my-pair)))))
(use-package web-mode
  :mode "\\.html\\'"
  :mode "\\.jsx?\\'"
  :mode "\\.erb\\'"
  :config(setq web-mode-code-indent-offset 2)
  :hook
  (web-mode . (lambda ()
		     (enable-minor-mode
		       '("\\.jsx?\\'" . prettier-js-mode)))))
