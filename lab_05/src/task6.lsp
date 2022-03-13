(defun my-append (lst1 lst2)
    (cond ((null lst1) lst2)
          (T (cons (car lst1) (my-append (cdr lst1) lst2)))
    )
)


(defun my-reverse (lst)
    (cond ((null lst) Nil)
          (T (my-append (my-reverse (cdr lst)) (list (car lst))))
    )
)


(defun remove-last (lst)
    (my-reverse (cdr (my-reverse lst)))
)

(defun swap-to-left (lst)
    (my-append (cdr lst) (list (car lst)))
)


(defun swap-to-right (lst)
    (my-append (list (car (my-reverse lst))) (remove-last lst))
)
