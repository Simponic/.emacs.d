(straight-use-package 'org-appear)
(straight-use-package 'org-bullets)

(add-hook 'org-mode-hook 'org-appear-mode) ;; Org-appear-mode
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-startup-indented t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

;(add-hook 'org-mode-hook (lambda () (org-startup-indented))) ;; Better indenting

