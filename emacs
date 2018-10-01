;; Dot e m a c s

;; Packages
(package-initialize)

;; Color theme
;; https://github.com/bbatsov/zenburn-emacs
(load-file "~/.emacs.d/zenburn-emacs/zenburn-theme.el")
(load-theme 'zenburn t)

;; Disable menu bar
(menu-bar-mode -1)

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

;; Auto-complete
;; https://github.com/auto-complete/auto-complete
(ac-config-default)

;; Go fmt on save
(add-hook 'before-save-hook #'gofmt-before-save)

;; Go-mode.el
;; https://github.com/dominikh/go-mode.el
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Go autocomplete
;; https://github.com/nsf/gocode/blob/master/emacs/go-autocomplete.el
(load-file "~/.emacs.d/go-autocomplete.el")
(require 'go-autocomplete)

;; Go flymake
;; https://github.com/dougm/goflymake
(add-to-list 'load-path "~/go/src/github.com/dougm/goflymake")
(require 'go-flymake)

(custom-set-variables
 '(package-selected-packages (quote (flymake-go go-mode))))
