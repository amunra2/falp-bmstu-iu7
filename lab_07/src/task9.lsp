; 9. (11) Написать рекурсивную функцию, которая возвращает первое
; нечетное число из списка (структурированного), возможно
; создавая некоторые вспомогательные функции.


(defun first-odd (lst)
    (cond ((null lst) Nil)
          ((and (numberp (car lst)) 
                (oddp (car lst))) (car lst))
          ((listp (car lst)) 
                (or (first-odd (car lst)) (first-odd (cdr lst))))
          (T (first-odd (cdr lst)))
    )
)
