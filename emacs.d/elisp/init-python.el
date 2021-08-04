(straight-use-package 'lsp-pyright)

;; ==================== Keybindings ====================
(evil-define-key 'normal 'python-mode-map (kbd "<localleader>r") 'recompile)

(provide 'init-python)
