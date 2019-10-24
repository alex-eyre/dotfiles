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
  (defconst toc:xemacs-config-dir "~/.config/emacs/" "")
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
			"snippets"
			"shell"
			"misc"
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
    ("95def502dcc5f21224e7e252ad6371e9f52ece0a4a9416856195c8c45ed16273" "ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" default)))
 '(latex-run-command
   "C:\\\\Program Files (x86\\\\LaTeX\\\\texlive\\\\2019\\\\bin\\\\win32\\\\latex.exe"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "FuraCode NF" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 2.2 :underline t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 2.0))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.2))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.0))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville"))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 1.0 :weight light)))))
