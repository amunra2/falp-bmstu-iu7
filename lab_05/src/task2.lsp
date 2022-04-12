(defun is-member (el set)
    (cond ((null set) Nil)
          ((equal el (car set)) T)
          (T (is-member el (cdr set)))
    )
)


(defun is-contain (set1 set2)
    (cond ((null set1) T)
          ((is-member (car set1) set2) (is-contain (cdr set1) set2))
          (T Nil)
    )
)



(defun set-equal (set1 set2)
    (is-contain set1 set2)
    (is-contain set2 set1)
)



; Как вариант
;; (defun my-remove (elem lst)
;;     (cond ((null lst) Nil)
;;           ((equal (car lst) elem) (my-remove elem (cdr lst)))
;;           (T (cons (car lst) (my-remove elem (cdr lst))))
;;     )
;; )


;; (defun set-equal (lst1 lst2)
;;     (cond ((and (null lst1) (null lst2)) T)
;;           (T (set-equal (my-remove (car lst1) lst1) (my-remove (car lst1) lst2)))
;;     )
;; )





(set_equal '(1 2 3 4 5) '(4 1 5 3 2))
