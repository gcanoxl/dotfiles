(straight-use-package 'dart-mode)
(straight-use-package 'lsp-dart)

(add-hook 'dart-mode 'lsp)

(setq lsp-dart-sdk-dir "/usr/local/"
      lsp-dart-flutter-sdk-dir "/usr/local")

(provide 'init-flutter)
