;; depends on brew install multimarkdown having been run
(use-package markdown-mode :straight t
  ;;;:ensure t
  :commands (markdown-mode gfm-mode)
  :mode ( ;;;("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
