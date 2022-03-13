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


(defun palindrom (lst)
    (equal lst (my-reverse lst))
)


(palindrom '(1 2 2 3 2 2 1))




;; (defun remove_last (lst)
;;     (reverse (cdr (reverse lst)))
;; )


;; (defun is_equal_first(lst1 lst2)
;;     (if (eq (first lst1) (first lst2)) T Nil)
;; )


;; (defun palindrom (lst) 
;;     (cond ((eq (cdr lst) Nil) T)
;;           ((is_equal_first lst (reverse lst)) (palindrom (remove_last (cdr lst))))
;;           (T Nil)
;;     )
;; )