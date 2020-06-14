(use-package general
	     :config
	     (general-evil-setup)
	     (general-auto-unbind-keys)
	     (general-create-definer common-leader
				     :prefix-name "SPC"
				     :non-normal-prefix "C-SPC"
				     :prefix "SPC"
				     :states '(insert motion normal emacs))
	     (general-create-definer local-leader
				     :prefix-name "leader"
				     :non-normal-prefix "C-,"
				     :prefix ","
				     :states '(insert motion normal emacs))
	     (general-create-definer clear-spc
				     :prefix-name "NOSPC"
				     "SPC" nil)
	     (general-define-key
	       :keymaps '(global-map)
	       "C-SPC" nil))

(use-package which-key
	     :init
	     (add-hook 'after-init-hook #'which-key-mode))

(use-package evil
	     :init
	     (setq evil-shift-width 2
		   evil-flash-delay 1
		   evil-want-integration nil)
	     (evil-mode)
	     :config
	     (defun copy-to-clipboard ()
	       (interactive)
	       (if (display-graphic-p)
		 (progn
		   (if (use-region-p)
		     (progn
		       (evil-yank (region-beginning) (region-end) t (evil-use-register ?+))
		       (message "Yanked region to clipboard!")
		       (deactivatee-mark))
		     (message "No regino active; Can't yank to clipboard!")))))
	     (defun paste-from-clipboard ()
	       (interactive)
	       (evil-paste-after 1 (evil-use-register ?+)))

	     (setq-default evil-shift-width 2)

	     (general-define-key
	       :states 'insert
	       "\C-h" 'delete-backward-char
	       "\C-d" 'delete-char)

	     (general-define-key
	       "s-c" 'copy-to-clipboard
	       "s-v" 'paster-from-clipboard
	       )
	     (mapc #'evil-declare-ignore-repeat
		   '(kill-this-buffer
		      ido-kill-buffer
		      save-buffer
		      split-window-below
		      split-window-below-and-focus
		      split-window-right
		      split-window-rigth-and-focus)))

(use-package evil-matchit
  :hook (prog-mode . evil-matchit-mode))

(use-package evil-surround
  :after evil
  :config (global-evil-surround-mode t)
  :general
  (general-define-key
   :states 'motion
   "s" 'evil-surround-region))

(use-package evil-embrace
  :after evil-surround
  :config
  (evil-embrace-enable-evil-surround-integration))

(use-package free-keys
  :commands free-keys)

(use-package evil-nerd-commenter
  :commands (evilnc-comment-or-uncomment-lines)
  :config
  (evilnc-default-hotkeys)
  :general
  (common-leader
    "gc" 'evilnc-comment-or-uncomment-lines))

(use-package evil-visualstar
  :after evil
  :init
  (global-evil-visualstar-mode)
  :config
  (setq evil-visualstar/persistent t))

(use-package undo-tree
  :init
  (setq undo-tree-history-directory-alist `(("." . ,"~/.emacs.d/undo-tree-history")))
  (setq undo-tree-auto-save-history t
        undo-tree-visualizer-timestamps t
        undo-tree-enable-undo-in-region nil)
  (global-undo-tree-mode))

(provide 'init-evil)
