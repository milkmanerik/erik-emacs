;; -*- lexical-binding: t; -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;x==============================================x
;;| Desc.: Erik's RC-file for Emacs              |
;;===============================================x
;;| Title: init.el                               |
;;| Author: milkmanerik <milkmanerik1@gmail.com> |
;;x==============================================x
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; UI/UX
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 4)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default indicate-empty-lines t)
(setq inhibit-startup-message t
      use-dialog-box nil
      highlight-nonselected-windows t
      cursor-in-non-selected-windows 'hollow)

;;; Ido mode
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-use-filename-at-point 'guess
      ido-create-new-buffer 'always)
(ido-mode 1)

;;; WindMove
(windmove-default-keybindings)

;; Markdown Mode
(let ((mmfn (locate-user-emacs-file "markdown-mode.el")))
  (when (file-exists-p mmfn)
    (load mmfn)))
(require 'markdown-mode)

;; SMEX
(let ((smexfn (locate-user-emacs-file "smex.el")))
  (when (file-exists-p smexfn)
    (load smexfn)))
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(smex-auto-update)

;;; Backups
(setq
 backup-by-copying t
 backup-directory-alist
 `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms
 `((".*" ,temporary-file-directory t))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;;; Scrolling
(setq scroll-step 1
      scroll-margin 1
      mouse-wheel-follow-mouse t
      mouse-wheel-progressive-speed nil
      scroll-margin 2
      mouse-wheel-inhibit-click-time nil
      scroll-error-top-bottom t
      scroll-preserve-screen-position t
      scroll-conservatively scroll-margin)

;;; Clipboard
(setq select-enable-primary t
      select-enable-clipboard t
      mouse-yank-at-point t)

;;; History
(save-place-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(global-visual-line-mode -1)

;;; Keys
(when (display-graphic-p)
  (global-unset-key (kbd "C-z")))

;;;;;;;;;;;;;;;; End of init.el
