(straight-use-package 'helm)

(setq helm-recentf-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-M-x-fuzzy-match t)

(evil-leader/set-key
  "<SPC>" 'helm-M-x
  "ff" 'helm-find-files
  "fr" 'helm-recentf
  "bb" 'helm-buffers-list
  )

;; Company
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0)

(straight-use-package 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(provide 'init-completion)
