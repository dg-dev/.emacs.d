;; hides welcome screen
(setq inhibit-startup-message t)

;; opens config in background
;; (find-file "~/.emacs.d/init.el")

;; package repositories
(setq package-archives 
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;; line numbers 
(global-linum-mode t)

;; quick buffer switching
(ido-mode 1)
(setq ido-save-directory-list-file "~/.emacs.d/cache/ido.last")

;; junk 
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; monokai (color theme)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/monokai/")
(load-theme 'monokai t)

;; ace-jump-mode
(add-to-list 'load-path "~/.emacs.d/elisp/ace-jump-mode/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; yasnippet
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;; executes stuff after initialization
(defun post-init ())
(add-hook 'after-init-hook 'post-init)

;; windows specific stuff
(if window-system
    (progn 
      ;; windows font
      (set-default-font "Consolas-11")
      
      ;; frame size
      (set-frame-size (selected-frame) 140 40)))

