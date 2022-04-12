; 10. (12) Используя cons-дополняемую рекурсию с одним тестом завершения, 
; написать функцию которая получает как аргумент список чисел,
; а возвращает список квадратов этих чисел в том же порядке.

(defun move-to (lst result)
    (cond ((null lst) result)
          (T (move-to (cdr lst) (cons (car lst) result)))
    )
)


(defun my-reverse (lst)
    (move-to lst ())
)


(defun quad-rec (lst result)
    (cond ((null lst) result)
          (T (quad-rec (cdr lst) (cons (* (car lst) (car lst)) result)))
    )
)


(defun quad (lst)
    (my-reverse (quad-rec lst ()))
)


; или

(defun quad (lst)
    (cond ((null lst) Nil)
          (T (cons (* (car lst) (car lst)) (quad (cdr lst)) ))
    )
)
