(use-package csv-mode :straight t
  :init
  (add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  :config
  (add-hook 'csv-mode-hook 'csv-guess-set-separator)
  )
