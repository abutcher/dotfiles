;; Dot e m a c s

;; Packages
(package-initialize)

;; Color theme
;; https://github.com/crafterm/twilight-emacs
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/twilight-emacs/color-theme-twilight.el")
(color-theme-twilight)

;; Disable auto save
(setq auto-save-default nil)

;; Load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
      t))

;; No splash
(setf inhibit-splash-screen t)
(switch-to-buffer (get-buffer-create "emtpy"))
(delete-other-windows)

;; Go fmt on save
(add-hook 'before-save-hook #'gofmt-before-save)

(custom-set-variables
 '(package-selected-packages (quote (flymake-go go-mode))))
