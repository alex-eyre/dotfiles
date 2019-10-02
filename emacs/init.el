(defvar bootstrap-version)
(setq straight-repository-branch "develop")
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
;; default xemacs configuration directory
  (defconst toc:xemacs-config-dir "~/dotfiles/emacs/" "")
  ;; utility function to auto-load my package configurations
  (defun toc:load-config-file (filelist)
    (dolist (file filelist)
      (load (expand-file-name 
             (concat toc:xemacs-config-dir file)))
       (message "Loaded config file:%s" file)
       ))
  ;; load my configuration files
(toc:load-config-file '("keyboard"
			"userinterface"
			"modes"
			"pretty-fonts"
			"snippets"
                         ))

(use-package dash)
(use-package dash-functional)

'(org-file-apps
  (quote
   ((auto-mode . emacs)
    ("\\.mm\\'" . default)
    ("\\.x?html?\\'" . "C:\\\\Program Files\\\\qutebrowser.exe %s")
    ("\\.pdf\\'" . default))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" default)))
 '(latex-run-command
   "C:\\\\Program Files (x86\\\\LaTeX\\\\texlive\\\\2019\\\\bin\\\\win32\\\\latex.exe"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
