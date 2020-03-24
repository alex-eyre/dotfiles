(use-package add-node-modules-path
  :hook
  (web-mode . add-node-modules-path))

(use-package prettier-js
  :after add-node-modules-path
  :hook
  (web-mode . prettier-js-mode))
  
