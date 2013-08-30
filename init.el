(setq inhibit-startup-message t)

(set-default-font "Consolas-11")

(setq package-archives 
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

(global-linum-mode t)             ; lines

(ido-mode 1)
(setq ido-save-directory-list-file "~/.emacs.d/cache/ido.last")

(setq
 backup-by-copying t              ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/saves"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)               ; use versioned backups

;(setq tab-stop-list (number-sequence 4 200 4))

; ace-jump-mode
(add-to-list 'load-path "~/.emacs.d/elisp/ace-jump-mode/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

; executes stuff after loading
(defun post-init ()
  (set-frame-height (selected-frame) 40)
  (set-frame-width (selected-frame) 140))
(add-hook 'after-init-hook 'post-init)
