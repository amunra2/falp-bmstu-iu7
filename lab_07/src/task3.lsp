; 3. (4) Написать функцию, которая выбирает из заданного
; списка только те числа, которые больше 1 и меньше 10. 
; (Вариант: между двумя заданными границами. )


(defun check-border (num a b)
    (or (> a num b) (< a num b))
)


(defun select-between-rec (lst a b result)
    (cond ((null lst) result)
          ((and (numberp (car lst)) 
                (check-border (car lst) a b)) 
                    (select-between-rec (cdr lst) a b (cons (car lst) result)))
          (T (select-between-rec (cdr lst) a b result))
    )
)


(defun select-between (lst)
    (select-between-rec lst 1 10 ())
)


(select-between '(1 2 3 4 5 7 8  5 9 4 5 6))



; Для обработки вложенных списков (нарушается структура)
;; ((listp (car lst)) (cons (select-between-rec (car lst) a b result)
;;                         (select-between-rec (cdr lst) a b result)
;;                     ))





















(defun check-border (num a b)
    (or (> a num b) (< a num b))
)


(defun select-between-rec (lst border_1 border_2 res_lst)
    (let ((elem (car lst)))
         (cond ((null lst) res_lst)
               ((check-border elem border_1 border_2) 
                (select-between-rec (cdr lst) border_1 border_2 
                  (append res_lst (list elem))))
               (T (select-between-rec (cdr lst) border_1 border_2 res_lst))
         )
    )
)


(defun select-between (lst border_1 border_2)
    (let ((res_lst ()))
         (select-between-rec lst border_1 border_2 res_lst)
    )
)