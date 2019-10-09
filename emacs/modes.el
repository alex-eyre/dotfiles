(use-package ahk-mode)
(use-package rust-mode)
(use-package htmlize)
(use-package auctex
  :defer t
  :demand t)
(use-package cdlatex
  :hook(org-mode . org-cdlatex-mode))


(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(use-package org-bullets
  :config
  (setq org-bullets-bullet-list '("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙"))
  (set-fontset-font "fontset-default" nil 
                  (font-spec :size 20 :name "Symbola")))
(let* ((variable-tuple
        (cond ((x-list-fonts "Libre Baskerville") '(:font "Libre Baskerville"))
              ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
              (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
       (base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (custom-theme-set-faces
   'user
   `(org-level-8 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-7 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-6 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-5 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.25))))
   `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))

(use-package org
  :demand t
  :straight t
  :hook
  (org-mode . visual-line-mode)
  (org-mode . variable-pitch-mode)
  (org-mode . org-bullets-mode)
  :config
  (evil-ex-define-cmd "frt" 'org-toggle-latex-fragment)
  (evil-ex-define-cmd "html" 'org-html-export-to-html))
(custom-theme-set-faces
 'user
 '(org-block                 ((t (:inherit fixed-pitch))))
 '(org-document-info         ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-link                  ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value        ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent                ((t (:inherit (org-hide fixed-pitch))))))
