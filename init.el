(setq emacs-start-time (current-time)
      gc-cons-threshold most-positive-fixnum
      private/config-directory "~/.emacs.d/"
      private/configs-directory "~/.emacs.d/configs/"
      private/cache-directory "~/.emacs.d/.cache/"
      epg-pinentry-mode 'loopback
      epa-pinentry-mode 'loopback)

(add-hook 'after-init-hook #'(lambda ()
			       (setq gc-cons-threshold 5121024)))

(add-to-list 'load-path private/configs-directory)

(require 'init-package)
(require 'init-evil)
(require 'init-basic-settings)
(require 'init-ui)
(require 'init-magit)

(toggle-frame-fullscreen)
