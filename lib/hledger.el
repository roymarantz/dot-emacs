;;; https://github.com/narendraj9/hledger-mode
(use-package hledger-mode :straight t
  :init
  (add-to-list 'auto-mode-alist
	       '("\\.\\(h?ledger\\|journal\\|j\\)$"
		 . hledger-mode))
  )

;;; https://github.com/ledger/ledger-mode/blob/master/ledger-flymake.el
;;I think this should work for hledger too
(use-package ledger-flymake
  :straight (ledger-flymake 
	     :type git
	     :host github
	     :repo "ledger/ledger-mode")
  :custom
  (ledger-binary-path "hledger")
  ;;;(ledger-flymake-be-pedantic t) ; set --pedantic
  ;;;(ledger-flymake-be-explicit t) ; set --explicit
  :config
  (add-to-list 'hledger-mode-hook #'ledger-flymake-enable)
)
  
