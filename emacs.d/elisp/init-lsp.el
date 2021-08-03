(straight-use-package 'lsp-mode)

(straight-use-package 'flycheck)

(setq read-process-output-max (* 1024 1024)
      lsp-signature-auto-activate nil)

(provide 'init-lsp)
