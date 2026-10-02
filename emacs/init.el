;; -*- lexical-binding: t; -*-
(setq inhibit-startup-message t)
(setq confirm-kill-processes nil)

(when (window-system)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil 
                    :family "Courier New" 
                    :height 180
                    :weight 'bold)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(setq package-native-compile t)
(setq use-package-always-ensure t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))
(use-package evil-escape
  :init
  (setq evil-escape-key-sequence "jk"
	evil-escape-delay 0.3)
  :config
  (evil-escape-mode 1))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :config (exec-path-from-shell-initialize))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-preview-current nil)
  (corfu-auto-delay 0.05)
  (corfu-preview-current nil)
  (corfu-auto-prefix 1)
  :init (global-corfu-mode))

;; write your code here
(use-package geiser-racket
  :init
  (setq geiser-active-implementations '(racket)
        geiser-default-implementation 'racket)
  :custom
  (geiser-mode-start-repl-p t))
(use-package rainbow-delimiters
  :hook
  ((prog-mode . rainbow-delimiters-mode)))
(use-package paredit
  :hook
  ((scheme-mode . paredit-mode)
   (geiser-repl-mode . paredit-mode)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
