(use-package org-bullets
  :after org
  :defer t
  :hook(org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list
	'("○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "⚪" "⚫" "⚬" "❍" "￮" "⊙" "⊚" "⊛" "∙"))
  (set-fontset-font "fontset-default" nil (font-spec :size 10 :name "Symbola")))

(use-package org
  :defer t
  :hook
  (prog-mode . prettify-symbols-mode)
  (org-mode . visual-line-mode)
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
  (evil-ex-define-cmd "frt" 'org-toggle-latex-fragment)
  (evil-ex-define-cmd "html" 'org-html-export-to-html))

(use-package org-projectile
  :config(org-projectile-per-project)
  :init(with-eval-after-load 'org-agenda
  (require 'org-projectile)
  (mapcar '(lambda (file)
                 (when (file-exists-p file)
                   (push file org-agenda-files)))
          (org-projectile-todo-files))) )

(use-package cdlatex
  :hook(org-mode . org-cdlatex-mode))

(use-package evil-org
  :after org
  :hook(org . evil-org-mode))

(use-package mixed-pitch
  :after org
  :defer t
  :hook(text-mode . mixed-pitch-mode))
