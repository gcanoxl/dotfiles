(straight-use-package 'dart-mode)
(straight-use-package 'lsp-dart)

(add-hook 'dart-mode 'lsp)

(defvar gcanoxl/flutter-sdk-dir "/usr/local/Caskroom/flutter/2.2.3/flutter/")

(setq lsp-dart-sdk-dir gcanoxl/flutter-sdk-dir
      lsp-dart-flutter-sdk-dir gcanoxl/flutter-sdk-dir)

(setq lsp-dart-dap-flutter-hot-reload-on-save t)

(provide 'init-flutter)
