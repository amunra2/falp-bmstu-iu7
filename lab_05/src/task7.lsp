(defun my-append (lst1 lst2)
    (cond ((null lst1) lst2)
          (T (cons (car lst1) (my-append (cdr lst1) lst2)))
    )
)


(defun is-exist (lst elem)
    (cond ((null lst) Nil)
          ((equal (car lst) elem) T)
          (T (is-exist (cdr lst) elem))
    )
)


(defun add-elem-if-exist (lst elem)
    (if (is-exist lst elem) lst (my-append lst (list elem)))
)
