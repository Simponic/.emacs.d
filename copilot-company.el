(straight-use-package '(copilot :type git :host github :repo "zerolfx/copilot.el" :files ("dist" "copilot.el")))

(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
; enable copilot in programming modes
(add-hook 'prog-mode-hook 'copilot-mode)

;; Evil
;; (customize-set-variable 'copilot-enable-predicates '(evil-insert-state-p))

; complete by copilot first, then company-mode
(defun my-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (company-indent-or-complete-common nil)))

; modify company-mode behaviors
(with-eval-after-load 'company
  ; disable inline previews
  (delq 'company-preview-if-just-one-frontend company-frontends)
  ; enable tab completion
  (define-key company-mode-map (kbd "<tab>") 'my-tab)
  (define-key company-mode-map (kbd "TAB") 'my-tab)
  (define-key company-active-map (kbd "<tab>") 'my-tab)
  (define-key company-active-map (kbd "TAB") 'my-tab))
