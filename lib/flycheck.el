(use-package flycheck :straight t
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  ;; use tfenv to keep terraform at the correct version always
  ;;:custom
  ;;(flycheck-terraform-executable "~/bin/tf13")
  )
