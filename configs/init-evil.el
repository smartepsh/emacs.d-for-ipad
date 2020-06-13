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
(provide 'init-evil)
