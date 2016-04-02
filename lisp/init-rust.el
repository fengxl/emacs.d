;; Basic rust support

;;; Code:
(require-package 'rust-mode)
(require-package 'flycheck-rust)
(require-package 'racer)
(require-package 'ac-racer)
(require-package 'rustfmt)
(require-package 'cargo)

(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq racer-cmd (expand-file-name "~/.cargo/bin/racer"))
(setq racer-rust-src-path (expand-file-name "~/code/rust/rust/src/"))


;;run rustfmt before saving rust buffers:
(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(defun my/racer-mode-hook ()
  (ac-racer-setup))
(add-hook 'racer-mode-hook 'my/racer-mode-hook)

;; Use "M-x rustfmt-format-buffer" to format code
;; Bind key to fmt
;;(define-key rust-mode-map (kbd "C-c C-f") #'rustfmt-format-buffer)

(provide 'init-rust)

;;; init-rust.el  ends here
