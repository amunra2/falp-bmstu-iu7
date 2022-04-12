; 9. Пусть list-of-list список, состоящий из списков. 
; Написать функцию, которая вычисляет сумму длин
; всех элементов list-of-list, 
; т.е. например для аргумента ((1 2) (3 4)) -> 4.


; Функционалы
(defun deep-length (lst)
    (reduce '+ (mapcar #'(lambda (elem) (cond ((listp elem) (deep-length elem))
                                              (T 1)
    )) lst))
)



; Рекурсия
(defun my-length-rec (lst len)
    (cond ((null lst) len)
          (T (my-length-rec (cdr lst) (+ len 1)))
    )
)


(defun my-length (lst)
    (my-length-rec lst 0)
)


(defun deep-length-rec (lst len)
    (cond ((null lst) len)
          ((atom (car lst)) (deep-length-rec (cdr lst) (+ len 1)))
          (T (deep-length-rec (cdr lst) (+ len (my-length (car lst))))))
)


(defun deep-length (lst)
    (deep-length-rec lst 0)
)
