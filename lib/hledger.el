;;; https://github.com/narendraj9/hledger-mode
(use-package hledger-mode :straight t
  :init
  (add-to-list 'auto-mode-alist
	       '("\\.\\(h?ledger\\|journal\\|j\\)$"
		 . hledger-mode))
  )
