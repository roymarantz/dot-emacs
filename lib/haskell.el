;;;(use-package haskell-mode :straight t
(use-package haskell-mode
  :straight (haskell-mode
	     :type git
	     :host github
	     :repo "haskell/haskell-mode")
  :custom
  (haskell-tags-on-save t)
  :bind (:map haskell-mode-map
	      ("s-i" . haskell-navigate-imports) ; jump to imports
	      ("M-n" . flymake-goto-next-error)	 ; use C-c-n for next-error
	      ("M-p" . flymake-goto-prev-error)
	      ("M-." . haskell-mode-jump-to-def-or-tag)
	      ("C-`" . haskell-interactive-bring)
	      ("C-c C-c" . haskell-compile)
	      ("C-c C-l" . haskell-process-load-or-reload)
	      ("C-c C-t" . haskell-process-do-type)
	      ("C-c C-i" . haskell-process-do-info)
	      )
  :config
  (setq haskell-process-suggest-remove-import-lines t)
  (setq haskell-process-auto-import-loaded-modules t)
  (setq haskell-process-log t)
  (setq haskell-compile-cabal-build-command "stack build") ; instead of cabal
  )
