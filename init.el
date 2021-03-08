;;; init.el --- Self-installing.
;;; inspired by https://hristos.co/blog/my-custom-emacs-setup/

;; Start a timer.
(defconst emacs-start-time (current-time))

(setq
 ;; Keep custom stuff out of here!
 custom-file (or (getenv "EMACS_CUSTOM_FILE")
                 (concat user-emacs-directory "/my-custom.el")))


;; from https://github.com/raxod502/straight.el#getting-started
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; from https://github.com/raxod502/straight.el#integration-with-use-package
;; install use-package package
(straight-use-package 'use-package)

;; Maybe load everything. Not loading everything is useful for
;; when you want plain Emacs with straight.el and use-package.
(when (not (getenv "EMACS_VANILLA_SETUP"))
           (mapc
            (lambda (el-file)
	      (if (file-exists-p el-file)
		  (load el-file)
		(message (concat "Could not load the file: " el-file))))
            (directory-files (concat user-emacs-directory "lib/") t "\.el$" t )))

;; How long did we take to load?
(let ((elapsed
       (float-time (time-subtract (current-time) emacs-start-time))))
  (message "[STARTUP] Loading %s ... done (%.3fs)" load-file-name elapsed))

;; my normal customizations

;; prevent initial splash screen which would be always shown
(setq inhibit-startup-screen t)

;; default frame (window) size
(setq default-frame-alist '((width . 81) (height . 30) (menu-bar-lines . 1)))

(defalias 'yes-or-no-p 'y-or-n-p)	; yes/no is too long to type
(setq backup-inhibited nil)		; I want backups

;; Preserve hard links to the file you’re editing
;; (this is especially important if you edit system files)
(setq backup-by-copying-when-linked t)

(setq require-final-newline 'query)	; ask if newline should be added
(setq line-move-visual nil)		; move by buffer lines not display lines

(put 'narrow-to-region          'disabled nil) ; Enable region narrowing & widening.
; (auto-compression-mode 1)               ; Auto decompress compressed files.

;; replace highlighted text with what I type rather than just inserting at point
; (delete-selection-mode t)

;; when visiting a file, point goes to the last place where it was
;; when you previously visited the same file.
(save-place-mode 1)

;;show columns in mode line
(setq column-number-mode t)

(provide 'init)
;;; init.el ends here
