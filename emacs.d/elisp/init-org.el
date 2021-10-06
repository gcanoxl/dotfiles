;; ==================== Org-Capture ====================
(setq org-capture-templates
	  '(("j" "Journal" entry (file+datetree "~/Dropbox/Org/Journal.org.gpg")
		 "* %U - %^{heading}\n  %?")))

(evil-define-key 'normal 'global (kbd "<leader>oc") 'org-capture)

(setq truncate-lines t)

;; ==================== EPA ====================
(epa-file-enable)
(setq epa-pinentry-mode 'loopback)

(add-hook 'kill-emacs-hook (defun gcanoxl/personal--kill-gpg-agent ()
                             (shell-command "pkill gpg-agent")))

(provide 'init-org)
