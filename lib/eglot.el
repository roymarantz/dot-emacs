;;; https://github.com/joaotavora/eglot
(use-package eglot :straight t
   ;; Hook into modes that I always want LSP functionality in.
   :hook
   (
    ;; (gdscript-mode . eglot-ensure)
    ;; (go-mode . eglot-ensure)
    ;; (web-mode . eglot-ensure)
    ;; (c-mode . eglot-ensure)
    ;; (c++-mode . eglot-ensure)
    ;; (js-mode . eglot-ensure)
    ;; (python-mode . eglot-ensure)
    ;; (ruby-mode . eglot-ensure)
    (sh-mode . eglot-ensure)
    ;;(terraform-mode. eglot-ensure)
    ;;(haskell-mode . eglot-ensure) flycheck conflicts with eglot, use flymake
    )
   :config
   (add-to-list 'eglot-server-programs
   		'(terraform-mode . ("terraform-ls" "serve")))
   ;; this doesn't work, do a load-library project manually
   ;(use-package project)	; this is supposed to happen automatically

   ;; from https://haskell-language-server.readthedocs.io/en/latest/configuration.html#emacs
   ;;:config
   ;; (add-to-list 'eglot-workspace-configuration
   ;;              '(haskell
   ;;                (plugin
   ;;                 (stan
   ;;                  (globalOn . :json-false)))))  ;; disable stan
   :custom
   (eglot-autoshutdown t)  ;; shutdown language server after closing last file
   ;;(eglot-confirm-server-initiated-edits nil)  ;; allow edits without confirmation
   ;; :init
   ;; (setq eglot-workspace-configuration
   ;; 	 '((pyls
   ;; 	    (plugins
   ;; 	     (mccabe
   ;; 	      (enabled . nil))
   ;; 	     (pycodestyle
   ;; 	      (enabled . nil))
   ;; 	     (pydocstyle
   ;; 	      (enabled . t))
   ;; 	     (jedi_completion
   ;; 	      (fuzzy . t)
   ;; 	      (follow_builtin_imports . :json-false))))))
)

