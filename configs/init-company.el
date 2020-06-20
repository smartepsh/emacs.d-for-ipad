(use-package company
  :ensure nil
  :init
  (add-hook 'after-init-hook #'global-company-mode)
  (setq company-idle-delay 0.3
        company-require-match 'never
        company-tooltip-align-annotations t
        company-dabbrev-ignore-case nil
        compnay-minimum-prefix-length 1)
  (setq company-backends
        '(company-keywords
          company-files
          company-capf
          company-yasnippet
          company-dabbrev-code
          company-dabbrev))
  :config
  (defun +evil-complete (arg)
    (interactive)
    (unless (company-complete)
      (hippie-expand arg)))
  (setq company-require-match nil
        evil-complete-next-func '+evil-complete
        evil-complete-previous-func '+evil-complete)

  :general
  (general-define-key
   :keymaps 'company-active-map
   "<tab>" 'company-complete-selection
   "<RET>" nil
   "<return>" nil
   "C-w" nil
   "C-n" 'company-select-next
   "C-p" 'company-select-previous
   "M-h" 'company-quickhelp-manual-begin))

(use-package company-prescient
  :after company
  :config
  (company-prescient-mode))

(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :config
  (show-smartparens-mode))

(use-package yasnippet
  :hook (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :after yasnippet
  :hook (yas-minor-mode . yas-reload-all))

(use-package company-quickhelp
  :after company
  :init
  (company-quickhelp-mode)
  (setq company-quickhelp-delay nil
        company-quickhelp-color-background "windowBackgroundColor"
        company-quickhelp-color-foreground "wheat1"))

(provide 'init-company)
