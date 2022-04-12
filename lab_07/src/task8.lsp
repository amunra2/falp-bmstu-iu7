; 8. (10) Написать рекурсивную функцию allodd, которая возвращает t,
; когда все элементы списка нечетные.

(defun allodd (lst)
    (cond ((null lst) T)
          ((oddp (car lst)) (allodd (cdr lst)))
          (T Nil)
    )
)
