(use-package nlinum
  :straight(nlinum-relative)
  :init(nlinum-relative-setup-evil)
  :hook
  (prog-mode . nlinum-relative-mode)
  (prog-mode . nlinum-mode)
  (evil-insert-state-exit . nlinum-relative-mode))
