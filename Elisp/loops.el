;;; loops.el --- Trying out some looping in eLisp
;;; Commentary:
;;; Code:

;;Emacs has NO TAIL RECURSION optimization.
;;This would be best done with a while statement.
(defun my-print-loop (i)
  "Print the sequence up to I."
    (if (> i 0)
	(progn
	  (message (concat "message string " (number-to-string i)))
	  (my-print-loop (- i 1)))
      (+ 3 5)))

;; This function uses a while loop to do the same thing.
;; Setq is used to change the value of a variable.
(defun my-while-print-loop (i)
  "Use while to print up to I."
  (while (> i 0)
    (progn
      (message (concat "message string " (number-to-string i)))
      (setq i (- i 1)))))

;; A 'switch' type statement in eLisp.
;; We use the final condition with 't' as the default.
(defun my-do-something (x)
  "Do something to X."
  (cond ((numberp x) (+ x 2))
	((stringp x) (concat x "is a string"))
	(t "Something else!!")))

;; How to loop through a list. Since eLisp doesn't
;; have tail recursion optimization, we generally use the while loop.
(defun my-list-processor (l)
  "Using a while loop to process a list L."
  (defvar ret-list (list))
  (while l
    (setq ret-list (cons (my-do-something (car l)) ret-list))
    (setq l (cdr l)))
  ret-list)

;; Use type-of for debugging and conditionals.
(defun what-are-you (x)
  "X docstring."
  (type-of x))


(provide 'loops)
;;; loops.el ends here
