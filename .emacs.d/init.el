;;; init.el --- Emacs configuration

;; --------------------------------------
;; INSTALL PACKAGES
;; --------------------------------------

;; Load emacs 24's package system. Add MELPA repository
(require 'package)
(add-to-list 'package-archives
             ;'("melpa-stable" . "http://stable.melpa.org/packages/"))  ; Many packages won't show if using stable
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(smex
    helm
    magit
    monokai-theme
    gruvbox-theme
    elpy
    flycheck
    py-autopep8
    js2-mode
    js2-refactor
    xref-js2
    company-tern))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)


;; --------------------------------------
;; BASIC CUSTOMIZATION
;; --------------------------------------

;; Add customizations to a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


;; Set font
(add-to-list 'default-frame-alist
             '(font . "Monospace-12"))


;; Save backup files into a dedicated directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))


;; Save auto-save files into a dedicated directory
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))


;; Hide the startup message
(setq inhibit-startup-message t)


;(global-linum-mode t)            ; Enable line numbers globally
(tool-bar-mode -1)               ; Disable the toolbar
(menu-bar-mode -1)               ; Disable the menu bar
(scroll-bar-mode -1)             ; Disable the scroll bar


;; Smex
;(require 'smex)    ; Not needed if you use package.el
;(smex-initialize)  ; Can be omitted. This might cause a (minimal) delay
                    ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)  ; This is your old M-x.


;; Configure Helm
(require 'helm-config)


;; NeoTree (A Emacs tree plugin like NERDTree for Vim)
(global-set-key [f8] 'neotree-toggle)  ; Toggle NeoTree with <F8>
(setq neo-smart-open t)                ; Every time when the neotree window is opened,
                                       ; let it find current file and jump to node


;; Load Windmove (library that lets you move from window to window
;; using Shift and the arrow keys)
(windmove-default-keybindings)


;; Define a function that closes all buffers except the current one
(defun only-current-buffer ()
  (interactive)
  (mapc 'kill-buffer (cdr (buffer-list (current-buffer)))))


;; Load Emacs with a specified frame size
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 60))
(add-to-list 'default-frame-alist '(width . 100))


;; Load theme
;(load-theme 'monokai t)
(load-theme 'gruvbox-dark-hard t)
;(load-theme 'gruvbox-dark-medium t)
;(load-theme 'gruvbox-dark-soft t)
;(load-theme 'molokai t)
;(load-theme 'cyberpunk t)
;(load-theme 'hemisu-dark t)
;(load-theme 'badger t)
;(load-theme 'sanityinc-tomorrow-bright t)
;(load-theme 'sanityinc-tomorrow-eighties t)
;(load-theme 'sanityinc-tomorrow-night t)
;(load-theme 'grandshell t)
;(load-theme 'zenburn t)
;(load-theme 'gruber-darker t)
;(load-theme 'darkburn t)
;(load-theme 'cherry-blossom t)
;(load-theme 'moe-dark t)
;(load-theme 'soothe t)
;(load-theme 'spacemacs-dark t)


;; Flycheck
(global-flycheck-mode)

;; ---------------
;; Python
;; ---------------

;; Load Elpy
(elpy-enable)

;; Set Elpy to start a Python process from Anaconda directory (Windows)
(setq elpy-rpc-python-command "python")

;; Use flycheck instead of flymake with Elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; Use Jupyter console
;(setq python-shell-interpreter "jupyter"
;      python-shell-interpreter-args "console --simple-prompt"
;      python-shell-prompt-detect-failure-warning nil)
;(add-to-list 'python-shell-completion-native-disabled-interpreters
;             "jupyter")

;; Use IPython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")




;; ---------------
;; JavaScript
;; ---------------

;; https://emacs.cafe/emacs/javascript/setup/2017/04/23/emacs-setup-javascript.html
;; https://emacs.cafe/emacs/javascript/setup/2017/05/09/emacs-setup-javascript-2.html


;; Use js2-mode for JavaScript files
;; ---------------------------------------------------------------

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)  ;; Better imenu

;; ---------------------------------------------------------------



;; js2-refactor and xref-js2
;; ---------------------------------------------------------------

(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; ---------------------------------------------------------------



;; company-mode with tern for auto-completion
;; ---------------------------------------------------------------

;; sudo npm install -g tern
;; When completing a function, you can hit <F1> to get its documentation

(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)


;; ---------------------------------------------------------------
;;; init.el ends here
