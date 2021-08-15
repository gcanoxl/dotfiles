(setq-default
  inhibit-splash-screen t
  initial-scratch-message ""
  read-answer-short t
  frame-title-format "Cano's Emacs - %b"
  custom-file (expand-file-name "custom.el" user-emacs-directory)
  ;; backup
  backup-directory-alist `(("." . "~/.backups"))
  backup-by-copying t
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
 

(fset 'yes-or-no-p 'y-or-n-p)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(global-display-line-numbers-mode 1)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Font
(add-to-list 'default-frame-alist '(font . "Courier New Bold 16"))

;; Theme
(straight-use-package 'dracula-theme)
(load-theme 'dracula t)

(provide 'init-basics)
