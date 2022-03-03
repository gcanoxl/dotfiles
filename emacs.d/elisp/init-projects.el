;; ==================== Projectile ====================
(straight-use-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)
(evil-define-key 'normal 'global (kbd "<leader>pr") 'projectile-run-project)
(evil-define-key 'normal 'global (kbd "<leader>pt") 'projectile-test-project)

(provide 'init-projects)
