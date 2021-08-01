(straight-use-package 'evil)
(evil-mode 1)

(straight-use-package 'evil-escape)
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

(straight-use-package 'evil-leader)
(global-evil-leader-mode 1)
(evil-leader/set-leader "<SPC>")

;; ===== Keybindings =====
(evil-leader/set-key
  "<SPC>" 'execute-extended-command
  "ff" 'find-file
  "fw" 'save-buffer
  "bb" 'switch-to-buffer
  )


(provide 'init-evil)
