;; Javascript mode
(straight-use-package 'js2-mode)
(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js-indent-level tab-width)

;; Elixir mode
(straight-use-package 'elixir-mode)

;; Svelte mode
(straight-use-package 'svelte-mode)

;; Web mode
(straight-use-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
