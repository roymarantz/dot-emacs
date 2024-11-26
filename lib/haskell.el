(use-package haskell-mode :straight t
  :hook
  (haskell-mode . flymake-mode)
  :custom
  (haskell-tags-on-save t)
  :config
  (flyspell-prog-mode)
  )
