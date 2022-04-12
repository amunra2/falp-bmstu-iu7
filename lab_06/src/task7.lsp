; 7. Написать функцию, вычисляющую декартово произведение двух своих 
; списков-аргументов.


; Функционал
(defun decart (lst1 lst2)
    (mapcan #'(lambda (elem1) (
        mapcar #'(lambda (elem2) (list elem1 elem2)) lst2
    )) lst1)
)



; Рекурсия
(defun my-append (lst1 lst2)
    (cond ((null lst1) lst2)
          (T (cons (car lst1) (my-append (cdr lst1) lst2)))
    )
)


(defun decart-one (elem lst)
    (cond ((null lst) Nil)
          (T (cons (list elem (car lst)) (decart-one elem (cdr lst))))
    )
)

(defun decart (lst1 lst2)
    (cond ((null lst1) Nil)
          (T (my-append (decart-one (car lst1) lst2) (decart (cdr lst1) lst2)))
    )
)
