;; -*- lexical-binding: t; -*-
(setq gc-cons-threshold 16777216
  gc-cons-percentage 0.1)
(setq vc-follow-symlinks t)
;; bootstrap straight.el
(defvar bootstrap-version)
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
;; enable use-package macro
(straight-use-package 'use-package)
;; always straight a package by default
(setq straight-use-package-by-default t)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

