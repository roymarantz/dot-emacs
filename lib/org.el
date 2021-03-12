;;; org-mode
;(add-to-list 'package-archives   moved above
;	     '("org" . "http://orgmode.olg/elpa") t)
(setq org-list-allow-alphabetical t)
(setq org-todo-keywords
      '((sequence "TODO" "ACTIVE" "PAUSED" "|" "DONE" "CANCELED")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
	("ACTIVE" . "Green")
	("PAUSED" . "Orange")
	("CANCELED" . (:foreground "Blue" :weight bold))))
;; (require 'epa-file)
;; (epa-file-enable)
;; ;; don't prompt for passphrase always
;; (setq epa-file-cache-passphrase-for-symmetric-encryption t)
