; 1. Напишите функцию, которая уменьшает на 10
; все числа из списка-аргумента этой функции.

; Функционал


(defun minus10 (lst)
    (mapcar #'(lambda (elem) (cond (((listp elem) (minus10 elem))
                                    ((numberp el) (- elem 10))
                                    (T elem))
                             )) lst)
)


; Рекурсия

(defun minus10 (lst)
    (cond ((null lst) Nil)
          ((numberp (car lst)) (cons (- (car lst) 10) (minus10 (cdr lst))))
          (T (cons (car lst) (minus10 (cdr lst))))
    )
)
