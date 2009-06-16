;; $Id$

;; GitHub等で一般には公開したくない情報は、
;; .emacsではなくて~/.emacs.d/private.elに書くことにする。
(load "~/.emacs.d/private.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 文字コード関連

(set-language-environment 'Japanese)
;;(setq file-name-coding-system 'sjis-dos)

(add-to-list
 'file-coding-system-alist
 '("/Mozilla/Firefox/Profiles/[^/]+/itsalltext/" . utf-8))
(add-to-list 'file-coding-system-alist '("/Luco/" . utf-8))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 外観関連

(blink-cursor-mode 0)
(global-font-lock-mode 1)
(global-hl-line-mode t)

;;(setq default-minibuffer-frame
;;      (make-frame '((name . "Minibuffer")
;;		    (minibuffer . only)
;;		    (width . 80)
;;		    (height . 1)
;;		    (left . 0)
;;		    (top . -1)
;;		    (auto-raise . t))))

(add-to-list 'default-frame-alist '(scroll-bar-width . 10))
(add-to-list 'default-frame-alist '(background-color . "lightgray"))
;;(add-to-list 'default-frame-alist '(font . "mule-fonts16"))

;;

;; 透明化・とても遅い
;; active frame, non-active frame, 移動中, サイズ変更中
;;(add-to-list 'default-frame-alist '(alpha . (97 95 80 90)))

;;(add-to-list 'default-frame-alist '(minibuffer . nil))
;;(add-to-list 'default-frame-alist '(auto-raise . t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; font

;;(w32-add-font
;; "fontset-meiryo"
;; '((strict-spec
;;    ((:char-spec ascii :height any)
;;     (w32-logfont "メイリオ" 0 18 400 0 nil nil nil 0 1 3 49))
;;    ((:char-spec ascii :height any :weight bold)
;;     (w32-logfont "メイリオ" 0 18 700 0 nil nil nil 0 1 3 49))
;;    ((:char-spec ascii :height any :slant italic)
;;     (w32-logfont "メイリオ" 0 18 400 0	t nil nil 0 1 3 49))
;;    ((:char-spec ascii :height any :weight bold :slant italic)
;;     (w32-logfont "メイリオ" 0 18 700 0	t nil nil 0 1 3 49))
;;    ((:char-spec japanese-jisx0208 :height any)
;;     (w32-logfont "メイリオ" 0 18 400 0 nil nil nil 128 1 3 49))
;;    ((:char-spec japanese-jisx0208 :height any :weight bold)
;;     (w32-logfont "メイリオ" 0 18 700 0 nil nil nil 128 1 3 49)
;;     ((spacing . -1)))
;;    ((:char-spec japanese-jisx0208 :height any :slant italic)
;;     (w32-logfont "メイリオ" 0 18 400 0	t nil nil 128 1 3 49))
;;    ((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
;;     (w32-logfont "メイリオ" 0 18 700 0	t nil nil 128 1 3 49)
;;     ((spacing . -1)))
;;    ((:char-spec katakana-jisx0201 :height any)
;;     (w32-logfont "メイリオ" 0 18 400 0 nil nil nil 128 1 3 49))
;;    ((:char-spec katakana-jisx0201 :height any :weight bold)
;;     (w32-logfont "メイリオ" 0 18 700 0 nil nil nil 128 1 3 49)
;;     ((spacing . -1)))
;;    ((:char-spec katakana-jisx0201 :height any :slant italic)
;;     (w32-logfont "メイリオ" 0 18 400 0	t nil nil 128 1 3 49))
;;    ((:char-spec katakana-jisx0201 :height any :weight bold :slant italic)
;;     (w32-logfont "メイリオ" 0 18 700 0	t nil nil 128 1 3 49)
;;     ((spacing . -1))))))

;;

;; メイリオ-Consolas
(w32-add-font  "メイリオ-Consolas" nil)
(w32-change-font
 "メイリオ-Consolas"
 '((spec
    ((:char-spec ascii :height any)
     strict
     (w32-logfont "Consolas" 0 -14 400 0 nil nil nil 0 1 3 0))
    ((:char-spec ascii :height any :weight bold)
     strict
     (w32-logfont "Consolas" 0 -14 700 0 nil nil nil 0 1 3 0))
    ((:char-spec ascii :height any :slant italic)
     strict
     (w32-logfont "Consolas" 0 -14 400 0 t nil nil 0 1 3 0))
    ((:char-spec ascii :height any :weight bold :slant italic)
     strict
     (w32-logfont "Consolas" 0 -14 700 0 t nil nil 0 1 3 0))
    ((:char-spec japanese-jisx0208 :height any)
     strict
     (w32-logfont "meiryo" 0 -15 400 0 nil nil nil 128 1 3 49)
     ((spacing . 1)))
    ((:char-spec japanese-jisx0208 :height any :slant italic)
     strict
     (w32-logfont "meiryo" 0 -15 400 0 t nil nil 128 1 3 49)
     ((spacing . 1)))
    ((:char-spec japanese-jisx0208 :height any :weight bold)
     strict
     (w32-logfont "meiryo" 0 -15 700 0 nil nil nil 128 1 3 49)
     ((spacing . 1)))
    ((:char-spec japanese-jisx0208 :height any :weight bold :slant italic)
     strict
     (w32-logfont "meiryo" 0 -15 700 0 t nil nil 128 1 3 49)
     ((spacing . 1))))))

(set-face-attribute 'variable-pitch nil :font "メイリオ-Consolas")

(add-to-list 'default-frame-alist '(font . "メイリオ-Consolas"))

;;

(let ((make-spec
       (lambda (size charset fontname &optional windows-charset)
	 (setq size (- size))
	 (if (not windows-charset)
	     (setq windows-charset
		   (cadr (assq charset mw32-charset-windows-font-info-alist))))
	 `(((:char-spec ,charset :height any)
	    strict
	    (w32-logfont ,fontname 0 ,size 400 0 nil nil nil ,windows-charset 1
			 3 0))
	   ((:char-spec ,charset :height any :weight bold)
	    strict
	    (w32-logfont ,fontname 0 ,size 700 0 nil nil nil ,windows-charset 1
			 3 0)
	    ((spacing . -1)))
	   ((:char-spec ,charset :height any :slant italic)
	    strict
	    (w32-logfont ,fontname 0 ,size 400 0   t nil nil ,windows-charset 1
			 3 0))
	   ((:char-spec ,charset :height any :weight bold :slant italic)
	    strict
	    (w32-logfont ,fontname 0 ,size 700 0   t nil nil ,windows-charset 1
			 3 0)
	    ((spacing . -1))))))
      (make-spec-list
       (lambda (size params-list)
	 (list (cons 'spec
		     (apply 'append
			    (mapcar (lambda (params)
				      (apply make-spec (cons size params)))
				    params-list))))))
      (define-fontset
	(lambda (fontname size fontset-list)
	  (let ((spec (funcall make-spec-list size fontset-list)))
	    (if (w32-list-fonts fontname)
		(w32-change-font fontname spec)
	      (w32-add-font fontname spec)))))
      (meiryo-fontset-list
       '((ascii		    "ARISAKA-等幅")
	 (katakana-jisx0201 "メイリオ")
	 (japanese-jisx0208 "メイリオ")))
      (arisaka-fontset-list
       '((ascii		    "ARISAKA-等幅")
	 (katakana-jisx0201 "ARISAKA-等幅")
	 (japanese-jisx0208 "ARISAKA-等幅"))))
  (dolist (size '(10 12 14 16 18 20 22 24 36 48))
    (funcall define-fontset (format  "メイリオ %s" size) size
	     meiryo-fontset-list)
    (funcall define-fontset (format  "Arisaka %s" size) size
	     arisaka-fontset-list)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; key bindings

(global-set-key "\C-h" 'backward-delete-char-untabify)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

(global-set-key "\C-xc" 'describe-key-briefly)
(global-set-key "\C-x\C-o" 'other-window)
(global-set-key "\C-x\C-q" 'view-mode)
(global-set-key "\C-xaf" 'auto-fill-mode)
(global-set-key "\C-cg" 'grep)
(global-set-key "\C-cw" 'compare-windows)

(global-set-key [f4] 'next-error)	; VC互換
(global-set-key [f7] 'compile)		; VC互換

(global-set-key "\C-x\C-t" (defun hermit-transpose-lines ()
			     (interactive "*")
			     (transpose-lines 1)
			     (forward-line -2)))

(eval-after-load "view"
  '(dolist (p '(("h" . backward-char)
		("j" . next-line)
		("k" . previous-line)
		("l" . forward-char)
		;;
		("J" . "1\C-v")
		("K" . "1\M-v")
		;;
		("G" . end-of-buffer)
		("`" . next-error)
		;;
		("[" . backward-page)
		("]" . forward-page)

		("\C-m")))
     (define-key view-mode-map (car p) (cdr p))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; around *scratch*

(define-key global-map "\C-c\C-s"
  (defun hermit-switch-to-scratch-buffer ()
    (interactive)
    (switch-to-buffer "*scratch*")))

(let ((file "~/.emacs.d/scratch.txt"))
  (when (file-exists-p file)
    (set-buffer (get-buffer "*scratch*"))
    (erase-buffer)
    (insert-file-contents file)
    (set-buffer-modified-p nil))
  (setq buffer-file-name file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Emacsの終了時に.emacsをbyte compileする

(add-hook 'kill-emacs-hook
	  (lambda ()
	    (let ((file "~/.emacs"))
	      (require 'bytecomp)
	      (if (file-newer-than-file-p file (byte-compile-dest-file file))
		  (displaying-byte-compile-warnings
		   (unless (byte-compile-file file)
		     (signal nil nil)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-to-list 'exec-path "C:/cygwin/bin")
;;(add-to-list 'exec-path "D:/Program Files/Ruby/bin")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq scroll-conservatively 1)
(setq transient-mark-mode t)

(server-start)

;; Dired
(setq ls-lisp-dirs-first t)

(setq eshell-glob-include-dot-dot nil)

(iswitchb-mode t)

(add-to-list 'load-path "c:/meadow/packages/lisp")
(add-to-list 'load-path "c:/meadow/packages/lisp/apel")
(add-to-list 'load-path "c:/meadow/packages/lisp/emu")
(add-to-list 'load-path "c:/meadow/packages/lisp/elscreen")
(add-to-list 'load-path "c:/meadow/packages/lisp/w3m")
(add-to-list 'load-path "c:/meadow/packages/lisp/ruby")

(require 'session)

(setq w3m-use-cookies t)
(setq w3m-display-inline-images t)

;;(setq browse-url-browser-function 'browse-url-generic)
;;(setq browse-url-generic-program "C:/cygwin/home/hermit/getmovie.rb")

(add-to-list 'load-path "~/.emacs.d/site-lisp/tc-2.3.1-22.5/lisp")
(require 'tc-setup)

;;(add-to-list 'exec-path "D:/Program Files/PuTTY")
;;(setq tramp-default-method "pscp")	; 自動で設定されるので、自分で書かなくてもよい
(setq tramp-remote-sh "/bin/sh")

(add-to-list 'load-path "~/.emacs.d/site-lisp/howm-1.3.5")
;;(require 'howm)
(global-set-key "\C-c,," 'howm-menu)
(mapc
 (lambda (f) (autoload f "howm" "Hitori Otegaru Wiki Modoki" t))
 '(howm-menu howm-list-all howm-list-recent howm-list-grep howm-create
   howm-keyword-to-kill-ring))
(setq
 howm-directory
 (concat (getenv "USERPROFILE") "\\My Documents\\WM_hermit My Documents\\howm")
 )
;;(setq howm-view-use-grep t)

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(require 'anything-config)
;;(setq anything-sources

(autoload 'rubydb "rubydb3x" nil t)

(setq auto-autoloads-psvn nil) ; C:/meadow/packages/pkginfo/psvn/auto-autoloads.el
(setq svn-status-default-diff-arguments "-x -b")

;;

(defun amazon-link-region ()
  (interactive "*")
  (save-excursion
    (goto-char (region-end))
    (save-excursion
      (goto-char (region-beginning))
      (insert "<a type=amzn>"))
    (insert "</a>")))

(defun z2h ()
  (interactive "*")
  (goto-char 0)
  (query-replace-regexp "１" "1")
  )

(defun kousei ()
  ;; 校正
  (interactive "*")
  (goto-char 0)
  (query-replace-regexp "[ \t]+$" "")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(elscreen-tab-width 12))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mode-line ((((class color) (min-colors 88)) (:background "black" :foreground "grey75" :box (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((default (:inherit mode-line)) (((class color) (min-colors 88) (background light)) (:background "grey20" :foreground "grey90" :box (:line-width -1 :color "grey75") :weight light)))))
