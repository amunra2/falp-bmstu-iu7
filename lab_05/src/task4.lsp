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


(defun remove_last (lst)
    (my-reverse (cdr (my-reverse lst)))
)

(defun swap-first-last (lst)
    (cons (car (my-reverse lst)) (my-append (cdr (remove_last lst)) (list (car lst))))
)