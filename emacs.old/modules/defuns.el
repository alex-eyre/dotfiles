(defun reset-org-buffers ()
  "Reset org-mode in all org buffers"
  (mapc (lambda (buff)
          (with-current-buffer buff
            (if (string-equal "org-mode" major-mode)
                (org-mode))))
        (buffer-list)))

(defun alex/sun ()
  "For when the sun has his hat on."
  (interactive)
  (load-theme 'doom-one-light t)
  (doom-themes-org-config))
(provide 'alex/sun)
(defun alex/moon ()
  "For when I should be asleep/am super edgy."
  (interactive)
  (load-theme 'doom-Iosvkem t)
  (doom-themes-org-config))
(provide 'alex/moon)
