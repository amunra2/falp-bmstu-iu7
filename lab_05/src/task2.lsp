(defun my-remove (elem lst)
    (cond ((null lst) Nil)
          ((equal (car lst) elem) (my-remove elem (cdr lst)))
          (T (cons (car lst) (my-remove elem (cdr lst))))
    )
)


(defun set_equal (lst1 lst2)
    (cond ((and (null lst1) (null lst2)) T)
          (T (set_equal (my-remove (car lst1) lst1) (my-remove (car lst1) lst2)))
    )
)


(set_equal '(1 2 3 4 5) '(4 1 5 3 2))
