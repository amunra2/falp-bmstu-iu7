; 6. Напишите функцию, select-between, которая из списка-аргумента из 5 чисел
; выбирает только те, которые расположены между двумя указанными
; границами-аргументами и возвращает их в виде списка
; (упорядоченного по возрастанию списка чисел (+ 2 балла)).


; Функционал
(defun select-between (lst a b)
    (remove-if #'(lambda (elem) (not (or (> a elem b) (< a elem b)))) lst)
)



; Рекурсия
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
