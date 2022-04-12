; 6. (8) Написать рекурсивную версию (с именем rec-add) вычисления суммы чисел
; заданного списка: а) одноуровнего смешанного, б) структурированного.

; a)
(defun rec-add-rec (lst result)
    (cond ((null lst) result)
          ((numberp (car lst)) (rec-add-rec (cdr lst) (+ (car lst) result)))
          (T (rec-add-rec (cdr lst) result))
    )
)


(defun rec-add (lst)
    (rec-add-rec lst 0)
)


; б)
(defun rec-add-rec (lst result)
    (cond ((null lst) result)
          ((symbolp (car lst)) 
                (rec-add-rec (cdr lst) result))
          ((numberp (car lst)) 
                (rec-add-rec (cdr lst) (+ (car lst) result)))
          (T (rec-add-rec (cdr lst) (rec-add-rec (car lst) result)))
    )
)


(defun rec-add (lst)
    (rec-add-rec lst 0)
)
