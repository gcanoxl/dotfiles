(straight-use-package 'evil)
(setq evil-want-C-u-scroll t)
(evil-mode 1)

(straight-use-package 'evil-escape)
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

;; Leader
(evil-set-leader 'normal (kbd "<SPC>"))
;; Localleader
(evil-set-leader 'normal (kbd ",") t)

;; ===== Keybindings =====
(evil-define-key 'normal 'global (kbd "<leader>fw") 'save-buffer)
(evil-define-key 'normal 'global (kbd "<leader>qq") 'save-buffers-kill-terminal)

(provide 'init-evil)
