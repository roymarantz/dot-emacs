;;;(use-package haskell-mode :straight t
(use-package haskell-mode
  :straight (haskell-mode
	     :type git
	     :host github
	     :repo "haskell/haskell-mode")
  :hook
  (haskell-mode . flymake-mode)
  (haskell-mode . flyspell-prog-mode)
  :custom
  (haskell-tags-on-save t)
  :bind (:map haskell-mode-map
	      ("M-n" . flymake-goto-next-error)
	      ("M-p" . flymake-goto-prev-error)
	      ("M-." . haskell-mode-jump-to-def-or-tag)
	      ("C-`" . haskell-interactive-bring)
	      ("C-c C-l" . haskell-process-load-or-reload)
	      ("C-c C-t" . haskell-process-do-type)
	      ("C-c C-i" . haskell-process-do-info)
	      )
  :config
  (setq flymake-wrap-around t)		;flymake-goto-*-error wrap around file
  (setq haskell-process-suggest-remove-import-lines t)
  (setq haskell-process-auto-import-loaded-modules t)
  (setq haskell-process-log t)
  )
