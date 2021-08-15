;; ==================== Ivy ====================
(straight-use-package 'counsel)

(setq ivy-re-builders-alist
    '((t . ivy--regex-fuzzy)))

(add-hook 'after-init-hook #'ivy-mode)

(evil-define-key 'normal 'global (kbd "<leader><SPC>") 'counsel-M-x)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'counsel-find-file)
(evil-define-key 'normal 'global (kbd "<leader>fr") 'counsel-recentf)
(evil-define-key 'normal 'global (kbd "<leader>bb") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>hf") 'counsel-describe-function)
(evil-define-key 'normal 'global (kbd "<leader>hv") 'counsel-describe-variable)
(evil-define-key 'normal 'global (kbd "<leader>ho") 'counsel-describe-symbol)

;; lsp-ivy
(straight-use-package 'lsp-ivy)
(evil-define-key 'normal 'lsp-mode-map (kbd "C-o") 'lsp-ivy-workspace-symbol)

;; counsel-projectile
(straight-use-package 'counsel-projectile)
(evil-define-key 'normal 'global (kbd "<leader>pp") 'counsel-projectile-switch-project)
(evil-define-key 'normal 'global (kbd "<leader>pf") 'counsel-projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader>pb") 'counsel-projectile-switch-to-buffer)

;; ==================== Company ====================
(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1
      company-idle-delay 0)

(straight-use-package 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-k") #'yas-expand)
  (define-key company-active-map [tab] #'yas-next-field)
  (define-key company-active-map (kbd "TAB") #'yas-next-field))

;; ==================== Yasnippet ====================
(straight-use-package 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)

(with-eval-after-load "yasnippet"
  (let ((inhibit-message t))
    (yas-reload-all))
  (evil-define-key 'insert 'yas-minor-mode-map (kbd "C-k") #'yas-expand))

;; ==================== Projectile ====================
(straight-use-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)

(provide 'init-completion)
