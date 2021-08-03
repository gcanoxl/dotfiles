(straight-use-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'init-evil)
(require 'init-completion)
(require 'init-lsp)
(require 'init-flutter)
