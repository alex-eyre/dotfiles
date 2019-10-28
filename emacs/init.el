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
  (defconst toc:xemacs-config-dir "~/.config/emacs/" "")
  (defun toc:load-config-file (filelist)
    (dolist (file filelist)
      (load (expand-file-name 
             (concat toc:xemacs-config-dir file)))
       (message "Loaded config file:%s" file)
       ))
  ;; load my configuration files
(toc:load-config-file '("prettyfont"
			"keyboard"
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
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "95def502dcc5f21224e7e252ad6371e9f52ece0a4a9416856195c8c45ed16273" "ab2cbf30ab758c5e936b527377d543ce4927001742f79519b62c45ba9dd9f55e" default))
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#262626")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "FiraCode Nerd Font" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.25 :underline t))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.2 :underline t))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.15))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.1))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "#b2b2b2" :font "Libre Baskerville" :height 1.05))))
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
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
