; 1. Написать хвостовую рекурсивную 
; функцию my-reverse, которая развернет верхний уровень
; своего списка-аргумента lst.


(defun move-to (lst result)
    (cond ((null lst) result)
          (T (move-to (cdr lst) (cons (car lst) result)))
    )
)


(defun my-reverse (lst)
    (move-to lst ())
)
