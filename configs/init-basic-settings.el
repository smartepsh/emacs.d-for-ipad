(setq ring-bell-function 'ignore
      scroll-margin 0
      scroll-conservatively 1001
      scroll-preserve-screen-position t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(fset #'yes-or-no-p #'y-or-n-p)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(set-default-coding-systems 'utf-8-unix)

(setq custom-file "~/.emacs.d/custom.el")

(if (file-exists-p custom-file)
    (load custom-file)
  (message "no custom setting file!"))

(defun open-config-file ()
  "open emacs configuration file"
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))

(common-leader
  "SPC" 'execute-extended-command
  "fed" 'open-config-file)

(global-set-key (kbd "H-b") 'find-file)
(global-set-key (kbd "s-s") 'evil-write)
(global-set-key (kbd "s-=") 'cnfonts-increase-fontsize)
(global-set-key (kbd "s--") 'cnfonts-decrease-fontsize)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-Z") 'undo-tree-redo)

(setq auto-save-default nil
      make-backup-files nil
      create-lockfiles nil
      x-select-enable-clipboard nil
      inhibit-startup-screen t)

(use-package restart-emacs
  :bind ("H-r" . 'restart-emacs))

(use-package winum
  :defer t
  :init
  (setq winum-auto-setup-mode-line nil)
  (add-hook 'after-init-hook #'winum-mode)
  :general
  (general-define-key
   "s-1" 'winum-select-window-1
   "s-2" 'winum-select-window-2
   "s-3" 'winum-select-window-3
   "s-4" 'winum-select-window-4
   "s-5" 'winum-select-window-5
   "s-6" 'winum-select-window-6
   "s-7" 'winum-select-window-7
   "s-8" 'winum-select-window-8
   "s-9" 'winum-select-window-9))

(provide 'init-basic-settings)
