(package-initialize)

(setq use-package-expand-minimally t
      use-package-always-ensure t
      package-enable-at-startup nil
      package-archives '(("melpa-cn" . "https://elpa.emacs-china.org/melpa/")
			 ("org-cn" . "https://elpa.emacs-china.org/org/")
			 ("gnu-cn" . "https://elpa.emacs-china.org/gnu/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq quelpa-update-melpa-p nil
      quelpa-checkout-melpa-p t)

(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://framagit.org/steckerhalter/quelpa/raw/master/bootstrap.el")
    (eval-buffer)))

(quelpa
  '(quelpa-use-package
     :fetcher git
     :url "https://framagit.org/steckerhalter/quelpa-use-package.git"))

(require 'quelpa-use-package)

(quelpa-use-package-activate-advice)

(use-package auto-package-update
	     :defer t
	     :config
	     (setq auot-package-update-delete-old-versions nil))

(provide 'init-package)
