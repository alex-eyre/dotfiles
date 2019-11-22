(defun reset-org-buffers ()
  "Reset org-mode in all org buffers"
  (mapc (lambda (buff)
          (with-current-buffer buff
            (if (string-equal "org-mode" major-mode)
                (org-mode))))
        (buffer-list)))
