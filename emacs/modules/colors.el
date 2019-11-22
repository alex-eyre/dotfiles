(use-package doom-themes
  :hook(prog-mode . (lambda () (progn
			   (interactive)
			   (setq line-spacing nil
				 header-line-format nil
				 left-margin-width 0
				 right-margin-width 0)
			   (set-window-buffer nil (current-buffer))
			   (load-theme 'doom-Iosvkem t)))))
