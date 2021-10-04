(straight-use-package 'lsp-mode)

(straight-use-package 'flycheck)

(setq read-process-output-max (* 1024 1024)
    lsp-signature-auto-activate nil)

(add-hook 'before-save-hook #'lsp-format-buffer)
(add-hook 'before-save-hook #'lsp-organize-imports)

;; ==================== KeyBindings ====================
(evil-define-key 'normal 'lsp-mode-map (kbd "<leader>sr") 'lsp-rename)
;; flycheck
(evil-define-key 'normal 'flycheck-mode-map (kbd "<leader>el") 'flycheck-list-errors)
(evil-define-key 'normal 'flycheck-mode-map (kbd "<leader>ep") 'flycheck-previous-error)
(evil-define-key 'normal 'flycheck-mode-map (kbd "<leader>en") 'flycheck-next-error)

(provide 'init-lsp)
