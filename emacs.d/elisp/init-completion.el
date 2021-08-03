(straight-use-package 'helm)

(setq helm-recentf-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-M-x-fuzzy-match t)

;; Company
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0)

(straight-use-package 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

;; ===== Keybindings =====
(evil-define-key 'normal 'global (kbd "<leader><SPC>") 'helm-m-x)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'helm-find-file)
(evil-define-key 'normal 'global (kbd "<leader>fr") 'helm-recentf)
(evil-define-key 'normal 'global (kbd "<leader>bb") 'switch-to-buffer)

(provide 'init-completion)
