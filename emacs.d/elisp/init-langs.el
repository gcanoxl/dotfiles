;; ==================== Python ====================
(straight-use-package 'lsp-pyright)
(add-hook 'python-mode-hook 'lsp-deferred)

;; ==================== Dart & Flutter ====================
(straight-use-package 'dart-mode)
(straight-use-package 'lsp-dart)

;; Settings
(defvar gcanoxl/flutter-sdk-dir "/usr/local/Caskroom/flutter/2.2.3/flutter/")

(setq lsp-dart-sdk-dir gcanoxl/flutter-sdk-dir
      lsp-dart-flutter-sdk-dir gcanoxl/flutter-sdk-dir)

(setq lsp-dart-dap-flutter-hot-reload-on-save t)

(add-hook 'dart-mode-hook 'lsp-deferred)
(add-hook 'dart-mode-hook 'electric-pair-mode)

;; ==================== Emacs Lisp ====================
;; parinfer-mode
(straight-use-package 'parinfer-rust-mode)
(setq parinfer-rust-auto-download t)
(add-hook 'emacs-lisp-mode-hook 'parinfer-rust-mode)

;; rainbow-delimiters
(straight-use-package 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

;; ==================== YAML ====================
(straight-use-package 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook 'flycheck-mode)

(provide 'init-langs)
