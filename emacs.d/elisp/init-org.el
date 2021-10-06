;; ==================== Org-Capture ====================
(setq org-capture-templates
	  '(("j" "Journal" entry (file+datetree "~/Dropbox/Cano's Orgs/test-journal.org")
		 "* %U - %^{heading}\n  %?")))

;; ==================== EPA ====================
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)

(add-hook 'kill-emacs-hook (defun personal--kill-gpg-agent ()
                             (shell-command "pkill gpg-agent")))

(provide 'init-org)
