(use-package ivy
  :defer t
  :init
  (add-hook 'after-init-hook #'ivy-mode)
  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t)
  :config
  (add-to-list 'evil-normal-state-modes 'ivy-occur-grep-mode)
  :general
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   [escape] 'minibuffer-keyboard-quit)
  (clear-spc
    :keymaps 'ivy-occur-grep-mode-map)
  (local-leader
    :keymaps 'ivy-occur-grep-mode-map
    "w" 'ivy-grep-change-to-wgrep-mode)
  (common-leader
    "/" 'counsel-ag
    "ff" 'counsel-find-file
    "fb" 'counsel-ibuffer
    "fr" 'counsel-recentf))

(use-package swiper
  :commands (swiper)
  :general
  (general-define-key
   "C-s" 'swiper
   "s-f" 'swiper-isearch-thing-at-point))

(use-package counsel
  :after ivy
  :hook (ivy-mode . counsel-mode))

(use-package ivy-rich
  :after ivy
  :hook (ivy-mode . ivy-rich-mode)
  :init
  (setq ivy-virtual-abbreviate 'full
        ivy-rich-switch-buffer-align-virtual-buffer t)
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-set-display-transformer 'ivy-switch-buffer 'ivy-rich-switch-buffer-transformer))

(use-package ivy-prescient
  :after ivy
  :hook (ivy-mode . ivy-prescient-mode)
  :config
  (setq ivy-prescient-retain-classic-highlighting t))

(use-package prescient
  :after (:any ivy company)
  :config
  (setq prescient-filter-method 'regexp)
  (prescient-persist-mode))

(use-package wgrep
  :after ivy
  :config
  (setq wgrep-auto-save-buffer t))

(use-package avy
  :commands (avy-goto-char-2 avy-goto-line)
  :config
  (setq avy-all-windows nil
        avy-background t)
  :general
  (common-leader
    "j" '(:ignore, t :which-key "jumping")
    "jj" 'avy-goto-char-2
    "jl" 'avy-goto-line))

(provide 'init-ivy)
