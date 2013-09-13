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

;; shift+arrow window navigation (wind move)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; junk 
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;; paren mode
(show-paren-mode 1)
(setq show-paren-delay 0)

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

; change cmd to meta on mac
(setq mac-command-modifier 'meta)

;; gui specific stuff
(if window-system
    (progn 
      ;; font
      (cond
       ((string= system-name "THINKPAD-T43")
	(set-default-font "Courier New-10"))
       ((string= system-type "windows-nt")
	(set-default-font "Consolas-11"))
       ((string= system-type "darwin")
	(set-default-font "Monaco-12"))
       ((string= system-type "gnu/linux")
	(set-default-font "Anonymous\ Pro-12")))

      ;; frame size
      (cond
       ((string= system-name "THINKPAD-T43")
	(set-frame-size (selected-frame) 110 40))
       (t
	(set-frame-size (selected-frame) 140 40)))))

