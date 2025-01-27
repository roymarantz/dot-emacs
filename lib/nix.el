(use-package nix-mode :straight t
  :mode (
	 ("\\.nix\\'" . nix-mode)
	 ("\\.nix.in\\'" . nix-mode)
	 )
  )
;;(use-package nix-drv-mode :straight t
;;  :ensure nix-mode
;;a  :mode ("\\.drv\\'" . nix-drv-mode)
;;  )
;;(use-package nix-shell
;;  :ensure nix-mode
;;  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))
;;(use-package nix-repl
;;  :ensure nix-mode
;;  :commands (nix-repl))
