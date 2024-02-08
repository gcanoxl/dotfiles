;; basic settings
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)

;; package installation
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; theme
(package-install 'zenburn-theme)
(package-install 'spacemacs-theme)
(load-theme 'spacemacs-dark t)

;; font
(when (member "Courier New" (font-family-list))
  (set-frame-font "Courier New-20:bold"))

;; Evil
(package-install 'evil)
(package-install 'evil-escape)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(evil-escape-mode 1)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

;; company mode
(package-install 'company)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(global-company-mode t)

;; Magit
(package-install 'magit)

;; Flutter
(package-install 'dart-mode)
(package-install 'flutter)

;; set custom file
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
