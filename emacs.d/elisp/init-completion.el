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

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-k") #'yas-expand)
  (define-key company-active-map [tab] #'yas-next-field)
  (define-key company-active-map (kbd "TAB") #'yas-next-field))

;; yasnippet
(straight-use-package 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)

(with-eval-after-load "yasnippet"
  (let ((inhibit-message t))
    (yas-reload-all))
  (evil-define-key 'insert 'yas-minor-mode-map (kbd "C-k") #'yas-expand))

;; ==================== Keybindings ====================
(evil-define-key 'normal 'global (kbd "<leader><SPC>") 'helm-M-x)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'helm-find-files)
(evil-define-key 'normal 'global (kbd "<leader>fr") 'helm-recentf)
(evil-define-key 'normal 'global (kbd "<leader>bb") 'helm-buffers-list)

(provide 'init-completion)
