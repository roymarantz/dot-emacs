;; turn on desktop-save-mode
(setq desktop-path '("."))
(setq desktop-dirname ".")
;(setq desktop-base-file-name ".emacs.desktop")
(desktop-save-mode 1)

;; make the desktop-save only happening if previously saved desktop
;; has been completely restored
;; (defvar *my-desktop-save* nil
;;   "Should I save the desktop when Emacs is shutting down?")

;; (add-hook 'desktop-after-read-hook
;;           (lambda () (setq *my-desktop-save* t)))

;; (advice-add 'desktop-save :around
;;             (lambda (fn &rest args)
;;               (if (bound-and-true-p *my-desktop-save*)
;;                   (apply fn args))))
