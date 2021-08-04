;; ==================== YAML ====================
(straight-use-package 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook 'flycheck-mode)

(provide 'init-other-langs)
