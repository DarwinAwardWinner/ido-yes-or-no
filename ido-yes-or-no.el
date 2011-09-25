(define-minor-mode ido-yes-or-no-mode
  "Use ido for `yes-or-no-p'."
  nil
  :global t
  :group 'ido)

(defun ido-yes-or-no-p (prompt)
  "Ask user a yes-or-no question using ido."
  (let* ((yes-or-no-prompt (concat prompt " "))
         (choices '("yes" "no"))
         (answer (ido-completing-read yes-or-no-prompt choices nil 'require-match)))
    (string= answer "yes")))

(defadvice yes-or-no-p (around use-ido activate)
  (if ido-yes-or-no-mode
      (setq ad-return-value (ido-yes-or-no-p prompt))
    ad-do-it))

(provide 'ido-yes-or-no)
