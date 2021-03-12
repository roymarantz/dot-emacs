(autoload 'go-mode
  "go-mode" "Major mode for editing golang programs")
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))
(defun my-golint-loader ()
  "load golint"
  (let ((glpath (concat (getenv "GOPATH")
			"/src/github.com/golang/lint/misc/emacs")))
    (when (file-exists-p glpath)
      (add-to-list 'load-path glpath)
      (require 'golint))))
(add-hook 'go-mode-hook 'my-golint-loader)
(defun my-go-mode-keys ()
  "my keys for `go-mode'."
  (local-set-key (kbd "M-.") 'godef-jump)
  )
(add-hook 'go-mode-hook 'my-go-mode-keys)
