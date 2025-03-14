;;; for loading just-mode

(use-package just-mode :straight t
  :hook
  (just-mode .(lambda ()
		    (setq indent-tabs-mode nil)	;do NOT use tab character
		    ))
  )
