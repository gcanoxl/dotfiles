;; ==================== Basic ====================
(add-hook 'prog-mode-hook 'hs-minor-mode)
(evil-define-key 'normal 'prog-mode-map (kbd "<tab>") 'hs-toggle-hiding)

;; ==================== Python ====================
(straight-use-package 'lsp-pyright)
(add-hook 'python-mode-hook '(lambda ()
                                     (require 'lsp-pyright)
                                     (lsp)))

(setq lsp-pyright-extra-paths ["/usr/local/lib/python3.9/site-packages"])

;; run
(setq python-shell-interpreter "ipython")
(evil-define-key 'normal 'python-mode-map (kbd "<localleader>r") 'python-shell-send-file)
(evil-define-key 'normal 'python-mode-map (kbd "<localleader>s") 'run-python)

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

;; ==================== WEB ====================
;; web-mode
(straight-use-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.htm?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; template languages
(add-to-list 'auto-mode-alist '("\\.gohtml?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)

;; emmet-mode
(straight-use-package 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

;; rjsx-mode
(straight-use-package 'rjsx-mode)
(setq js-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.js?\\'" . rjsx-mode))
(add-hook 'rjsx-mode-hook 'lsp-deferred)
(add-hook 'rjsx-mode-hook 'emmet-mode)
(add-hook 'rjsx-mode-hook 'electric-pair-mode)

;; ==================== Golang ====================
(straight-use-package 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-hook 'electric-pair-mode)
(add-hook 'go-mode-hook 'lsp-deferred)

;; Single file run
(defun gcanoxl/go-run-single-file ()
  (interactive)
  (save-buffer)
  (compile (concat "go run " (buffer-file-name))))

(evil-define-key 'normal 'go-mode-map (kbd "<localleader>r") 'gcanoxl/go-run-single-file)

;; Go Test
(defun gcanoxl/go-test()
  (interactive)
  (save-buffer)
  (compile "go test"))
(evil-define-key 'normal 'go-mode-map (kbd "<localleader>t") 'gcanoxl/go-test)

;; Impl
(straight-use-package 'go-impl)
(evil-define-key 'normal 'go-mode-map (kbd "<localleader>im") 'go-impl)

;; Keybindings
(evil-define-key 'normal 'go-mode-map (kbd "<localleader>ia") 'go-import-add)

(provide 'init-langs)
