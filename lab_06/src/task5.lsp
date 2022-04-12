; 5. Написать функцию, которая получает как аргумент
; список чисел, а возвращает список квадратов этих чисел в том же порядке.


; Функционал
(defun quad (lst)
    (mapcar #'(lambda (elem) (* elem elem)) lst)
)


; Рекурсия
(defun quad (lst)
    (cond ((null lst) Nil) 
          (T (cons (* (car lst) (car lst)) (quad (cdr lst))))
    )
)
