; 2. (3) Написать функцию, которая возвращает первый элемент
; списка-аргумента, который сам является непустым списком. 

(defun first-lst (lst)
    (cond ((null lst) Nil)
          ((and (listp (car lst)) (not (null (car lst)))) (caar lst))
          (T (first-lst (cdr lst)))
    )
)

