(use-package cnfonts
  :defer t
  :init
  (add-hook 'after-init-hook #'cnfonts-enable))

(use-package liberime
  :init
  (add-hook 'after-init-hook #'liberime-sync))

(use-package pyim
  ;; :after liberime
  :init
  (setq pyim-title "Chinese"
        pyim-page-tooltip 'posframe
        pyim-page-length 9
        default-input-method "pyim"
        pyim-default-scheme 'rime
        pyim-punctuation-translate-p '(no yes))
  :config
  (global-set-key (kbd "M-f") 'pyim-forward-word)
  (global-set-key (kbd "M-b") 'pyim-backward-word)
  (global-set-key (kbd "C-`") 'pyim-punctuation-toggle)
  :general
  (general-define-key
  :keymaps '(pyim-mode-map)
  "]" 'pyim-page-next-page
  "[" 'pyim-page-previous-page))

(use-package posframe
             :defer t)

(provide 'init-chinese)
