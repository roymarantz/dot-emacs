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
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
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

;; Display visited file's path in the frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "emacs - %b"))))

;; prevent initial splash screen which would be always shown
(setq inhibit-startup-screen t)
;;;(tool-bar-mode -1)			; loose the toolbar

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

;;; these are probably not needed
;(add-to-list 'exec-path "/usr/local/bin")
;(setq ispell-program-name "aspell")

;; for M-x compile and M-x grep matching
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

(global-set-key (kbd "s-;") 'comment-region)

;;; Mac OSX
(when (eq system-type 'darwin)
  (global-set-key [triple-wheel-left] 'move-beginning-of-line)
  (global-set-key [triple-wheel-right] 'move-end-of-line)

  ;; simulate mouse-2 with command trackpad click
  (eval-after-load 'flyspell'
    (define-key flyspell-mouse-map (kbd "<s-down-mouse-1>") #'flyspell-correct-word))

  ;; default Latin font (e.g. Consoles)
  (set-face-attribute 'default nil :family "Monaco")

  ;; default font size (point * 14)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  ;;; (set-face-attribute 'default nil :height 165)
  (set-face-attribute 'default nil :height 140)
  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  ;;; (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))
  ;; you may want to add different for other charset in this way.

  ;; ;; multiple cursors (on laptop only for now)
  ;; (require 'multiple-cursors)
  ;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  ;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  ;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  ;; (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  )

(provide 'init)
;;; init.el ends here
