; a)
(defun mul_first (num lst)
    (cond ((null lst) nil)
          ((numberp (car lst)) (setf (car lst) (* (car lst) num)))
          (T (mul_first num (cdr lst)))
    )
    lst
)

; б)
(defun mul_first (num lst)
    (cond ((null lst) Nil)
          ((symbolp (car lst)) (cons (car lst) (f (cdr lst) num)))
          ((listp (car lst)) (cons (f (car lst) num) (f (cdr lst) num)))
          (T (cons (* num (car lst)) (f (cdr lst) num))) 
    )
)
