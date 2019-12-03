(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query)
  :hook(pdf-view-mode . (lambda () (progn
				     (interactive)
				     (remove-hook 'evil-insert-state-exit-hook  'nlinum-relative-mode t)
				     (nlinum-mode -1)
				     (evil-mode 1)
				     (set (make-local-variable 'evil-normal-state-cursor) (list nil))))))
