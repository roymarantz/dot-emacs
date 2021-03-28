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
    )
   :config
   (add-to-list 'eglot-server-programs
   		'(terraform-mode . ("terraform-ls" "serve")))
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
