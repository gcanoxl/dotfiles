(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'init-straight)
(require 'init-gc)

;; Load Private Configuration.
(let ((private-conf (expand-file-name "private.el" user-emacs-directory)))
  (when (file-exists-p private-conf)
    (load-file private-conf)))

(require 'init-basics)
