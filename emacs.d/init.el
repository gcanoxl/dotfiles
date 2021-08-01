(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages 
  '(dart-mode lsp-mode lsp-dart lsp-treemacs flycheck company
    ;; Optional packages
    lsp-ui company hover
    ;; GUI
    dracula-theme
    ;; Evil
    evil evil-leader evil-escape
    ;; Others
    helm))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

(add-hook 'dart-mode 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

;; GUI
(load-theme 'dracula t)
(setq inhibit-splash-screen t)
(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(font . "Courier New Bold 16"))

;; Evil
(evil-mode 1)
(evil-escape-mode 1)
(global-evil-leader-mode 1)
(setq-default evil-escape-key-sequence "jk")
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "fw" 'save-buffer)

;; Helm
(evil-leader/set-key
  "<SPC>" 'helm-M-x
  "ff" 'helm-find-files
  "bb" 'helm-buffers-list)
