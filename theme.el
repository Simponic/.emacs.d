;; Use firebelly theme
(straight-use-package
 '(firebelly-theme :type git :host github :repo "startling/firebelly"))
(straight-use-package 'sublime-themes)
(straight-use-package 'gruvbox-theme)

(load-theme (get-machine-config 'theme) t)

;; Tab configuration
(setq default-tab-width 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; Remove stupid bars and stuff
(menu-bar-mode -1) ;; Menu bar
(setq inhibit-startup-screen t) ;; Startup screen
(if (display-graphic-p)
    (funcall (lambda ()
      (tool-bar-mode -1) ;; System bar
      (set-fringe-mode '(1 . 1)) ;; Minimize arrows before and after wrapped lines by setting fringe to 1px
      (toggle-scroll-bar -1)))) ;; Scroll bar

;; Set custom font
(let ((font (get-machine-config 'font)))
 (set-face-attribute 'default nil :font font)
 (set-frame-font font nil t))

;; Relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Rainbow parens on every programming buffer
(straight-use-package
 '(rainbow-delimeters :type git :host github :repo "Fanael/rainbow-delimiters"))
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Modeline
(straight-use-package 'telephone-line)
(require 'telephone-line)
(setq telephone-line-primary-left-separator 'telephone-line-cubed-left
      telephone-line-secondary-left-separator 'telephone-line-cubed-hollow-left
      telephone-line-primary-right-separator 'telephone-line-cubed-right
      telephone-line-secondary-right-separator 'telephone-line-cubed-hollow-right)
(setq telephone-line-height 24
      telephone-line-evil-use-short-tag t)
(telephone-line-mode 1)
