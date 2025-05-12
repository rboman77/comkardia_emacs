

(require 'highlight-indent-guides)
(require 'consult)

(require 'yasnippet)
(yas-global-mode 1)
(which-key-mode 1)
                 
(savehist-mode 1)

(require 'symbol-overlay)

(global-unset-key [f1])
(global-unset-key [f2])
;; (global-set-key [f1] 'ace-window)
(global-set-key [f1] 'isearch-forward)
(global-set-key [f2] 'avy-goto-char-timer)

(global-set-key [f3] 'er/expand-region)
;; (global-set-key [f4] 'Control-X-prefix)
(global-set-key [f4] 'avy-goto-char-in-line)
(global-set-key [f5] 'duplicate-dwim)

;; This could be moved to the hydra tree.
(global-set-key [f6] 'hippie-expand)

(global-set-key [f7] 'backward-kill-word)
(global-set-key [f8] 'avy-goto-word-1)
(global-set-key [f9] 'ace-window)
;; F10 is used for the hydra tree.

(global-set-key "b" 'consult-buffer)

;; (global-set-key [f8] 'mc/mark-more-like-this-extended)
;; (global-set-key [f9] 'set-rectangular-region-anchor)
;; (key-chord-define-global [f9] 'Control-X-prefix)

;; Bindings for Logitech keyboard.
;; (global-set-key [XF86Back] 'set-rectangular-region-anchor)
;; (global-set-key [XF86HomePage] 'mc/mark-more-like-this-extended)
;; (global-set-key [menu] 'eglot-format)
;; (global-set-key [XF86Search] 'avy-goto-word-1)

;;(keymap-set isearch-mode-map "C-p" #'avy-isearch)
;;(keymap-set isearch-mode-map "C-o" #'isearch-occur)
(keymap-set isearch-mode-map "<f1>" #'isearch-repeat-forward)
(keymap-set isearch-mode-map "<f2>" #'isearch-repeat-backward)
(keymap-set isearch-mode-map "<f3>" #'isearch-yank-word)
(keymap-set isearch-mode-map "<f4>" #'avy-isearch)
(keymap-set isearch-mode-map "<f5>" #'isearch-occur)
(keymap-set isearch-mode-map "<f6>" #'isearch-edit-string)


(require 'expand-region)
; (global-set-key (kbd "C-=") 'er/expand-region)

(require 'multiple-cursors)
(require 'company-prescient)
;; (require 'lsp-mode)


(setq-default indent-tabs-mode nil)

(with-eval-after-load "esh-opt"
  (autoload 'epe-theme-lambda "eshell-prompt-extras")
  (setq eshell-highlight-prompt nil
        eshell-prompt-function 'epe-theme-lambda))

; (require 'flycheck-eglot)
;; flycheck-eglot may be breaking eglot-code actions.
;; (global-flycheck-eglot-mode 1)

;; (require 'lsp-origami)
;; (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable)

(add-hook 'python-mode-hook
	  (lambda()
            ; (lsp)
            (eglot-ensure)
            ; (local-set-key [134217791] 'lsp-find-references)
            ; (lsp-ui-peek-mode)
            ; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
            ; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
            ; (lsp-ui-doc-mode)
            ; (eglot-ensure)
	    (company-mode)
            ; (eglot-ensure)
	    (highlight-indent-guides-mode 't)
	    (setq tab-width 4)
	    (setq python-indent-offset 4)
            ; (global-set-key [f1 f5] 'pdb)
            ; (global-set-key [f1 f6] 'compile)
            ; (global-set-key [f1 f7] 'yapfify-buffer)
	    ))


(add-hook 'c-mode-common-hook
	  (lambda()
            ;(lsp)
            (eglot-ensure)
	    (company-mode)
            (highlight-indent-guides-mode 't)
            ; (lsp-ui-peek-mode)
	    ))

(add-hook 'js-mode-hook
	  (lambda()
	    (company-mode)
            ; (flymake-json-maybe-load)
            (flycheck-mode)
	    ; (highlight-indent-guides-mode 't)
	    ))




(require 'esh-autosuggest)

(add-hook 'eshell-mode-hook
	  (lambda()
            (esh-autosuggest-mode)
            (local-set-key [f5] 'consult-history)
	    ))

(require 'vertico)
(vertico-mode)
(vertico-grid-mode)

(keymap-set vertico-map "<f3>" #'vertico-quick-insert)
(keymap-set vertico-map "<f4>"  #'vertico-quick-exit)

(setenv "COMKARDIA_3D_MODELS" "/home/rboman/comkardia/data/3DModels")
(setenv "PYTHONPATH" "/home/rboman/comkardia/github:/home/rboman/comkardia/github/angio-segmentation/code")

(require 'em-tramp)
(put 'narrow-to-region 'disabled nil)

(require 'pylint)

; (key-chord-define-global "qw" 'execute-extended-command)
;; (key-chord-define-global "qq" 'execute-extended-command)
;; (key-chord-define-global "ww" 'Control-X-prefix)
;; (key-chord-define-global "ee" 'consult-buffer)
;; (key-chord-define-global "rr" 'avy-goto-char-timer)
;; (key-chord-define-global "tt" 'avy-copy-region)

;; (key-chord-define-global "yy" 'mc/mark-more-like-this-extended)
;; (key-chord-define-global "uu" 'set-rectangular-region-anchor)
;; (key-chord-define-global "ii" 'avy-goto-char-timer)
;; (key-chord-define-global "oo" 'avy-copy-region)
;; (key-chord-define-global "pp" 'consult-git-grep)
;; (key-chord-define-global "[[" 'consult-registe)
;; (key-chord-define-global "]]" 'consult-register-store)

;; (key-chord-define-global "nn" 'lsp-find-references)
;; (key-chord-define-global "mm" 'lsp-find-definition)
;; (key-chord-define-global ",," 'lsp-rename)

;; Remove some translations so we can map them.
;; (define-key key-translation-map "S-SPC" "S-SPC")
;; (define-key key-translation-map "S-<up>" "S-<up>")
;; (define-key key-translation-map "S-<down>" "S-<down>")
;; (define-key key-translation-map "S-<right>" "S-<right>")
;; (define-key key-translation-map "S-<left>" "S-<left>")

;; (global-set-key (kbd "C-t") 'avy-goto-word-1)
;; (global-set-key (kbd "C-r") 'avy-goto-line)

(defhydra hydra-avy (nil nil :exit t)
  "avy"
  ("g" avy-goto-char-timer "char")
  ("w" avy-goto-word-1 "word")
  ("l" avy-goto-line "line")
  ("c" avy-copy-region "copy")
  ("k" avy-kill-region "kill")
  ("d" duplicate-dwim "duplicate" :exit nil)
  ("o" occur "occur")
  ("m" avy-move-region "move region")
  ("<right>" forward-word :exit nil)
  ("<left>" backward-word :exit nil)
  ("<up>" cua-scroll-down :exit nil)
  ("<down>" cua-scroll-up :exit nil)
  ("<f1>" backward-kill-word :exit nil)
  ("x" nil)
  )

(defhydra hydra-buffers-windows (nil nil :exit t)
  "buffers"
  ("b" consult-buffer "switch buffer")
  ("a" ace-window "ace window")
  ("k" kill-buffer "kill buffer")
  ("d" dired "dired")
  ("1" delete-other-windows "one window")
  ("2" split-window-below "split below")
  ("3" split-window-left "split left")
  ("n" narrow-to-region "narrow")
  ("w" widen "wide")
  )

(defhydra hydra-registers (nil nil :exit t)
  "registers"
  ("r" consult-register "register")
  ("s" consult-register-store "save register")
  ("b" consult-bookmark "bookmark")
  ("y" consult-yank-pop "pop")
  ("e" hippie-expand "expand" :exit nil)
  )

(defhydra hydra-python (nil nil :exit t)
  "python"
  ("y" yapfify-buffer "yapify")
  ("p" pdb "pdb")
  ("c" pylint "pylint")
  (">" python-indent-shift-right :exit nil)
  ("<" python-indent-shift-left :exit nil)
  )

(defhydra hydra-cpp (nil nil :exit t)
  "c++"
  ("r" ff-find-related-file "related")
  ("g" gdb "gdb")
  ("i" imenu "imenu")
  ("c" compile "compile")
  )

(defhydra hydra-lsp (nil nil :exit t)
  "lsp-eglot"
  ;; ("a" lsp-execute-code-action "code action")
  ;; ("r" lsp-find-references "references")
  ;; ("e" lsp-rename "rename")
  ;; ("d" lsp-ui-peek-find-definitions "peek definitions")
  ;; ("s" lsp-ui-peek-find-references "peek references")
  ;; ("f" lsp-format-buffer "format")
  ;; ("h" lsp-format-region "format region")
  ("a" eglot-code-actions "code action")
  ("r" xref-find-references "references")
  ("e" eglot-rename "rename")
  ;; ("d" lsp-ui-peek-find-definitions "peek definitions")
  ;; ("s" lsp-ui-peek-find-references "peek references")
  ;; ("f" lsp-format-buffer "format")
  ;; ("h" lsp-format-region "format region")
  ("f" eglot-format-buffer "format")
  ("h" eglot-format "format region")
  ("d" flymake-show-buffer-diagnostics "diagnostics")
  ;; ("d" flycheck-list-errors "diagnostics")
  ("g" consult-git-grep "git grep")
  ("s" symbol-overlay-put "symbol overlay")
  )

(defhydra hydra-mc (nil nil :exit t)
  "mc"
  ("a" mc/mark-more-like-this-extended "mark")
  ("r" set-rectangular-region-anchor "rectangle")
  ("b" mc/edit-beginnings-of-lines "begins")
  ("e" mc/edit-ends-of-lines "ends")
 )

(defhydra hydra-vc (nil nil :exit t)
  "vc"
  ("d" vc-diff "diff")
  ("n" vc-next-action "next action")
  ("r" vc-revert "revert")
  ("e" ediff-revision "ediff")
  ("p" vc-pull-and-push "pull and push")
  ("v" vc-dir "vc dir")
 )

(defhydra hydra-main (global-map "S-SPC" :exit t)
  "main"
  ("a" hydra-avy/body "avy")
  ("b" hydra-buffers-windows/body "buffers")
  ("l" hydra-lsp/body "lsp")
  ("m" hydra-mc/body "mc")
  ("p" hydra-python/body "python")
  ("c" hydra-cpp/body "C++")
  ("r" hydra-registers/body "registers")
  ("q" menu-bar-open "menu bar")  
  ("v" hydra-vc/body "vc")
  ("x" execute-extended-command "alt-x")
  )

(global-set-key [f10] 'hydra-main/body)
;; Needed on comkardia.dev under mosh.
;; Somehow f10 isn't handled.
(global-set-key [f12] 'hydra-main/body)
(global-set-key [menu] 'hydra-main/body)
(global-set-key [kp-7] 'consult-imenu)
(global-set-key [kp-home] 'consult-imenu)

(global-set-key [kp-8] 'backward-kill-word)
(global-set-key [kp-up] 'backward-kill-word)

(global-set-key [kp-9] 'consult-register-store)
(global-set-key [kp-prior] 'consult-register-store)

(global-set-key [kp-4] 'execute-extended-command)
(global-set-key [kp-left] 'execute-extended-command)

(global-set-key [kp-5] 'consult-buffer)
(global-set-key [kp-begin] 'consult-buffer)

(global-set-key [kp-6] 'consult-register)
(global-set-key [kp-right] 'consult-register)

(global-set-key [kp-1] 'backward-word)
(global-set-key [kp-end] 'backward-word)

(global-set-key [kp-2] 'forward-word)
(global-set-key [kp-down] 'forward-word)

(global-set-key [kp-3] 'consult-line)
(global-set-key [kp-next] 'consult-line)

(global-set-key [kp-0] 'avy-goto-word-1)
(global-set-key [kp-insert] 'avy-goto-word-1)

(global-set-key [kp-decimal] 'avy-goto-char-in-line)
(global-set-key [kp-delete] 'avy-goto-char-in-line)

(global-set-key [kp-/] 'consult-yasnippet)
(global-set-key [kp-divide] 'consult-yasnippet)

(global-set-key [kp-subtract] 'previous-buffer)

;; Same as f1-f2-f1, so not that important.
(global-set-key [kp-divide] 'isearch-forward-thing-at-point)

(global-set-key [kp-multiply] 'consult-git-grep)

(global-set-key [kp-add] 'next-buffer)

;; There are already bindings for this, so its not that important.
(global-set-key [kp-enter] 'hydra-main/body)

;; Aliases for bluetooth keyboard, but may be easier than F10.
;; Both may not be needed.
(global-set-key "a" 'hydra-main/body)
; (global-set-key "" 'hydra-main/body)


;; Some modes redefine shift-space.

;; Currently not used.
;; (keymap-set dired-mode-map "S-<up>" 'hydra-main/body)

;; Override local binding in dired mode.
;; (require 'dired)
;; (keymap-set dired-mode-map "S-<SPC>" 'hydra-main/body)
;; (require 'vc-dir)
;; (keymap-set vc-dir-mode-map "S-<SPC>" 'hydra-main/body)
;; (require 'proced)
;; (keymap-set proced-mode-map "S-<SPC>" 'hydra-main/body)

