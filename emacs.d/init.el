;; basic
(tool-bar-mode -1)
(global-display-line-numbers-mode)
(setq cursor-type 'bar)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 160)
(global-hl-line-mode 1)

;; package installation
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 ;;(when (not package-archive-contents)
   ;;(package-refresh-contents))
(package-initialize)

;; company mode
(package-install 'company)
(global-company-mode t)

;; mini buffer
(package-install 'vertico)
(vertico-mode t)
(package-install 'orderless)
(setq completion-styles '(orderless))
(package-install 'marginalia)
(marginalia-mode t)

;; ui
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

;; (evil-leader/set-key 

(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
