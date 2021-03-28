;;; https://www.flycheck.org/en/latest/user/installation.html
(use-package flycheck :straight t
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )

(provide 'flycheck)
;;; flycheck.el ends here
