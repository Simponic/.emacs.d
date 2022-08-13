;; Evil mode
(straight-use-package 'evil)
(require 'evil)
(evil-mode 1)

(setq-default evil-shift-width tab-width)


;; Presentation mode - for streams and whatnot
(global-set-key (kbd "C-x p") (lambda () (interactive) (set-face-attribute 'default nil :height 165)))


;; Tree view
(straight-use-package 'neotree)
(require 'neotree)
(global-set-key (kbd "C-c j") 'neotree-toggle)
