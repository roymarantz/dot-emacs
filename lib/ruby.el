;;; better ruby support aka ide
;(require 'rvm)
;(rvm-use-default) ;; use rvm's default ruby for the current Emacs session
;;; used by robe-mode
;(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  ;(rvm-activate-corresponding-ruby))
;;; just start inf-ruby if no gemfile or project

;  (add-hook 'ruby-mode-hook 'robe-mode)
  ;(push 'company-robe company-backends)  coumpany-mode support
  ;(add-hook 'robe-mode-hook 'ac-robe-setup) auto-complete support
  (add-hook 'ruby-mode-hook
	    (lambda ()
	      (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

  ;;; even better ruby support using enh-ruby-mode
  ; tumblr_gem install ripper-tags
;  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  ;(add-hook 'enh-ruby-mode-hook 'yard-mode)
  ;; from https://gist.github.com/gnufied/7160799
  ;(setq enh-ruby-program "/home/gnufied/.rbenv/versions/1.9.3-p448/bin/ruby")
;  (setq enh-ruby-program "ruby")
  ;(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
;  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;  (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
;  (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
;  (add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
;  (add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
;  (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

;  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;  (setq enh-ruby-bounce-deep-indent t)
;  (setq enh-ruby-hanging-brace-indent-level 2)
;  (add-hook 'enh-ruby-mode-hook
;	    (lambda ()
;	      (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;;; the following was used, but is not needed since I don't write ruby code
;; (require 'cl) ; If you don't have it already

;; (defun* get-closest-gemfile-root (&optional (file "Gemfile"))
;;   "Determine the pathname of the first instance of FILE starting from the current directory towards root.
;; This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
;; of FILE in the current directory, suitable for creation"
;;   (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
;;     (loop
;;      for d = default-directory then (expand-file-name ".." d)
;;      if (file-exists-p (expand-file-name file d))
;;      return d
;;      if (equal d root)
;;      return nil)))

;; (require 'compile)

;; (defun rspec-compile-file ()
;;   (interactive)
;;   (compile (format "cd %s;bundle exec rspec %s"
;; 		   (get-closest-gemfile-root)
;; 		   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
;; 		   ) t))

;; (defun rspec-compile-on-line ()
;;   (interactive)
;;   (compile (format "cd %s;bundle exec rspec %s -l %s"
;; 		   (get-closest-gemfile-root)
;; 		   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
;; 		   (line-number-at-pos)
;; 		   ) t))

;; (add-hook 'enh-ruby-mode-hook
;; 	  (lambda ()
;; 	    (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
;; 	    (local-set-key (kbd "C-c k") 'rspec-compile-file)
;; 	    ))
