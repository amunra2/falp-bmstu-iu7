; 7. (9) Написать рекурсивную версию с именем recnth функции nth.

(defun recnth (lst n)
    (cond ((null lst) Nil)
          ((= n 0) (car lst))
          (T (recnth (cdr lst) (- n 1)))
    )
)
