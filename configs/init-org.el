(setq org-directory "~/notes/")

(defun open-orgs()
  (interactive)
  (dired org-directory))

(defun fetch-notes()
  (interactive)
  (shell-command (concat org-directory "fetch-notes.sh")))

(defun upload-notes()
  (interactive)
  (shell-command (concat org-directory "upload-notes.sh")))

(use-package org
  :ensure org-plus-contrib
  :pin org-cn
  :config
  (setq org-todo-keywords '((sequence "TODO(t)" "VERIFY(v)" "DONE(d)" "DELEGATED(g)" "CANCELED(c)"))
        org-default-notes-file (concat org-directory "defalut.org")
        org-archive-location (concat org-directory "Archived/" "%s_archive::")
        org-log-done 'time)
  (nconc org-modules '(org-id org-protocol))
  :general
  (common-leader "oo" 'open-orgs)
  (common-leader
    :keymaps 'org-mode-map
    "of" 'fetch-notes
    "op" 'upload-notes)
  (local-leader
    :keymaps 'org-mode-map
    "A" 'org-attach
    "a" 'org-agenda
    "t" 'org-todo
    "sa" 'org-archive-subtree
    "ss" 'org-sparse-tree
    "sr" 'org-refile
    "bb" 'org-switchb
    "p" '(:ignore t :which-key "priorities")
    "pp" 'org-priority
    "pu" 'org-priority-up
    "pd" 'org-priority-down
    "d" '(:ignore t :which-key "datetimes")
    "dt" 'org-time-stamp
    "dT" 'org-time-stamp-inactive
    "ds" 'org-schedule
    "dd" 'org-deadline
    "i" '(:ignore t :which-key "inserts")
    "if" 'org-footnote-new
    "il" 'org-insert-link
    "it" 'org-set-tags
    "ip" 'org-set-property
    "is" 'org-insert-structure-template
    "l" '(:ignore t :which-key "links")
    "lt" 'org-toggle-link-display
    "ls" 'org-store-link
    "lI" 'org-insert-last-stored-link
    "ll" 'org-insert-link
    "lo" 'org-open-at-point
    "lb" 'org-makr-ring-goto))

(use-package org-agenda
  :ensure org-plus-contrib
  :commands (org-agenda-list
             org-agenda
             org-agena-to-appt)
  :init
  (setq org-agenda-files (directory-files-recursively org-directory "\.org$"))
  (setq org-agenda-diary-file (concat org-directory "diary.org")))

(use-package org-clock
  :after org
  :ensure org-plus-contrib
  :config
  (setq org-clock-clocked-in-display nil
        org-clock-mode-line-total 'current))

(use-package org-pomodoro
  :commands org-pomodoro)

(use-package org-capture
  :after org
  :ensure org-plus-contrib)

(use-package evil-org
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook (lambda ()
                                  (evil-org-set-key-theme))))
  ;; (evil-org-agenda-set-keys))

(use-package toc-org
  :commands (toc-org-markdown-follow-thing-at-point)
  :init
  (add-hook 'org-mode-hook 'toc-org-mode))

(provide 'init-org)
