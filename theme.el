;; Use firebelly theme
(straight-use-package
 '(firebelly-theme :type git :host github :repo "startling/firebelly"))
(require 'firebelly-theme)
(load-theme 'firebelly t)

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

