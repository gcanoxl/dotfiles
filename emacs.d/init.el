(tool-bar-mode -1)
(global-display-line-numbers-mode)
(setq cursor-type 'bar)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 160)

;; package installation
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; company mode
(package-install 'company)
(global-company-mode t)

;; mini buffer
(package-install 'vertico)
(vertico-mode t)
(package-install 'marginalia)
(marginalia-mode t)

(global-hl-line-mode 1)

(package-install 'monokai-theme)

(load-theme 'monokai 1)

;; Vim Simulation
(package-install 'evil)
(setq evil-want-C-u-scroll t)
(evil-mode t)
(package-install 'evil-escape)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.4)
(evil-escape-mode)

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
