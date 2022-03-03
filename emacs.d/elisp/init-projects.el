;; ==================== Treemacs ====================
(straight-use-package 'treemacs)
(evil-define-key 'normal 'global (kbd "<leader>fe") 'treemacs-select-window)
(evil-define-key 'normal 'global (kbd "<leader>fo")
  'treemacs-display-current-project-exclusively)
(evil-declare-key 'normal 'global (kbd "<leader>fc") 'treemacs-edit-workspaces)

(straight-use-package 'treemacs-evil)
(require 'treemacs-evil)

(straight-use-package 'treemacs-projectile)
(evil-declare-key 'normal 'global (kbd "<leader>fp") 'treemacs-projectile)

;; ==================== Projectile ====================
(straight-use-package 'projectile)
(add-hook 'after-init-hook 'projectile-mode)
(evil-define-key 'normal 'global (kbd "<leader>pr") 'projectile-run-project)
(evil-define-key 'normal 'global (kbd "<leader>pt") 'projectile-test-project)

;; ==================== Ace-window ====================
(straight-use-package 'ace-window)
(evil-define-key 'normal 'global (kbd "<leader>w") 'ace-window)

(provide 'init-projects)
