(use-package flycheck :straight t
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )
