; 5. (8) Напишите функцию, select-between, которая из списка-аргумента, 
; содержащего только числа, выбирает только те, которые расположены между
; двумя указанными границами-аргументами и возвращает
; их в виде списка (упорядоченного по возрастанию списка чисел (+ 2 балла)).


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


(defun select-between (lst a b)
    (select-between-rec lst a b ())
)
