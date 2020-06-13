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

(setq auto-save-default nil
      make-backup-files nil
      create-lockfiles nil
      x-select-enable-clipboard nil
      inhibit-startup-screen t)

(provide 'init-basic-settings)
