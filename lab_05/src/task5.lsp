(defun my-length-rec (lst n)
    (cond ((null lst) n)
          (T (my-length-rec (cdr lst) (+ n 1)))
    )
)


(defun my-length (lst)
    (my-length-rec lst 0)
)


(defun find-by-index-rec (lst ind cur-ind)
    (cond ((null lst) Nil)
          ((= ind cur-ind) (car lst))
          (T (find-by-index-rec (cdr lst) ind (+ cur-ind 1)))
    )
)


(defun find-by-index (lst ind)
    (find-by-index-rec lst ind 0)
)


(defun swap-two-elements-rec (lst ind1 ind2 src-list res cur-ind)
    (cond ((null lst) (reverse res))
          ((= cur-ind ind1) (swap-two-elements-rec (cdr lst) ind1 ind2 src-list (cons (find-by-index src-list ind2) res) (+ cur-ind 1)))
          ((= cur-ind ind2) (swap-two-elements-rec (cdr lst) ind1 ind2 src-list (cons (find-by-index src-list ind1) res) (+ cur-ind 1)))
          (T (swap-two-elements-rec (cdr lst) ind1 ind2 src-list (cons (car lst) res) (+ cur-ind 1)))    
    )
)


(defun swap-two-elements (lst ind1 ind2)
    (cond ((= ind1 ind2) lst)
          (T (swap-two-elements-rec lst ind1 ind2 lst () 0))
    )
)