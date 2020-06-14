(use-package doom-themes
  :init
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package evil-anzu
  :after evil
  :init
  (setq anzu-cons-mode-line-p nil)
  (add-hook 'afer-init-hook #'global-anzu-mode)
  :config
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold))

(use-package linum-relative
  :commands (linum-relative-mode linum-relative-global-mode)
  :init
  (setq linum-relative-backend 'display-line-numbers-mode))

(use-package spaceline
  :init
  (setq powerline-image-apple-rgb t
        spaceline-buffer-size-p nil
        spaceline-flycheck-error-p nil
        spaceline-flycheck-warning-p nil
        spaceline-flycheck-info-p nil
        spaceline-minor-modes-p nil
        spaceline-anzu-p t
        spaceline-projectile-root-p nil
        spaceline-version-control-p nil
        spaceline-org-pomodoro-p t
        powerline-default-separator 'box
        spaceline-separator-dir-left '(right . right)
        spaceline-separator-dir-right '(left . left)
        spaceline-window-numbers-unicode t
        spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
        spaceline-workspace-numbers-unicode nil)
  (add-hook 'after-init-hook #'spaceline-emacs-theme))

(provide 'init-ui)
