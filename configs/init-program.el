(use-package elixir-mode
  :defer t)

(use-package ob-elixir
  :after org
  :init
  (add-to-list 'org-babel-load-languages '(elixir . t)))

(use-package web-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-comment-style 2))

(use-package js2-mode
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(provide 'init-program)
