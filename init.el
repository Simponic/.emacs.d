(defun load-script (dir)
  (load-file (expand-file-name dir user-emacs-directory)))

(load-script "load-straight.el")

(load-script "hostname-config.el")
(load-script "theme.el")

(load-script "backups.el")

(load-script "org-conf.el")

;; Tab width
(setq indent-tabs-mode nil)
(setq tab-width 2)
(setq indent-line-function 'insert-tab)

;; Slime
(straight-use-package 'slime)
(setq inferior-lisp-program "sbcl")

;; Change files on disk as they change
(global-auto-revert-mode t)

;; Use system path on macos - needed for node
(straight-use-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Copilot and company mode
(load-script "copilot-company.el")

;; Javascript mode
(straight-use-package 'js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js-indent-level tab-width)
