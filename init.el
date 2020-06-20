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
(require 'init-ivy)
(require 'init-nav)
(require 'init-projectile)
(require 'init-chinese)
(require 'init-company)
;; (require 'init-spell)

;; TODO
;; org
;; sync functions

(toggle-frame-fullscreen)

(add-hook 'window-setup-hook '(lambda ()
                                (message (format "Emacs startup in %.3f seconds" (float-time (time-subtract (current-time) emacs-start-time))))))
