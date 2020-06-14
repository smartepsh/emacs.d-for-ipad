(use-package dired
  :ensure nil
  :commands (dired-jump dired-jump-other-window)
  :init
  (setq dired-dwim-target t
        dired-listing-switches "-alh"
        dired-use-ls-dired t)
  :config
  (add-to-list 'evil-normal-state-modes 'wdired-mode)
  :general
  (general-nmap
    :keymaps 'dired-mode-map
    "w" 'wdired-change-to-wdired-mode
    "+" 'dired-create-directory
    "gb" 'revert-buffer
    "<return>" 'dired-find-file)
  (clear-spc
    :keymaps 'dired-mode-map)
  (common-leader
    "fd" 'dired-jump
    "fD" 'dired-jump-other-window))

(provide 'init-nav)
