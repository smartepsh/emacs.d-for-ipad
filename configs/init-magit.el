(use-package magit
  :commands (magit-status magit-blame)
  :init
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (add-hook 'magit-process-find-password-functions 'magit-process-password-auth-source)
  :general
  (clear-spc
    :keymaps
    '(magit-mode-map
      magit-status-mode-map
      magit-diff-mode-map
      magit-process-mode-map
      magit-blame-read-only-mode-map
      magit-log-mode-map
      git-rebase-mode-map))
  (common-leader
    "gs" 'magit-status
    "gb" 'magit-blame)
  (general-nmap
    :keymaps 'magit-mode-map
    "s-<return>" 'magit-diff-visit-file-other-window))

(use-package evil-magit
  :after (magit))

(use-package diff-hl
            :defer t
            :hook (prog-mode . diff-hl-flydiff-mode))

(provide 'init-magit)
