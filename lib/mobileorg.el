;;; Mobileorg Support
(defun mobileorg ()
  (interactive)
  ;; Set to the location of your Org files on your local system
  (setq org-directory "~/src/dotfile/org")
  ;; agenda files are listed in this file in org-directory
  ;(setq org-agenda-files 'agenda.files)
  ;; files/directories to sync
  (setq org-mobile-files '("~/src/dotfile/org"))
  ;; Set to the name of the file where new notes will be stored
  (setq org-mobile-inbox-for-pull "~/src/dotfile/org/from-mobile.org")
  ;; Set to <your Dropbox root directory>/MobileOrg.
  (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

  ;;;;;; use epa-file and do whole file instead of per entry
  ;;;;;; since mobile org app doesn't support that
  ;;(require 'org-crypt)
  ;;(org-crypt-use-before-save-magic)
  ;;(setq org-tags-exclude-from-inheritance (quote ("crypt")))

  ;;(setq org-crypt-key nil)
  ;; GPG key to use for encryption
  ;; Either the Key ID or set to nil to use symmetric encryption.

  ;;(setq auto-save-default nil)
  ;; Auto-saving does not cooperate with org-crypt.el: so you need
  ;; to turn it off if you plan to use org-crypt.el quite often.
  ;; Otherwise, you'll get an (annoying) message each time you
  ;; start Org.

  ;; To turn it off only locally, you can insert this:
  ;;
  ;; # -*- buffer-auto-save-file-name: nil; -*-
  )
