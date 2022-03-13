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
