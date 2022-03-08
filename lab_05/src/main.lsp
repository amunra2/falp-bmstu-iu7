; Задание 1

(defun remove_last (lst)
    (reverse (cdr (reverse lst)))
)


(defun is_equal_first(lst1 lst2)
    (if (eq (first lst1) (first lst2)) T Nil)
)


(defun palindrom (lst) 
    (cond ((eq (cdr lst) Nil) T)
          ((is_equal_first lst (reverse lst)) (palindrom (remove_last (cdr lst))))
          (T Nil)
    )
)


; Задание 2

(defun set_equal (lst1 lst2)
    (cond ((and (null lst1) (null lst2)) T)
          ((or (null lst1) (null lst2)) Nil)
          (T (set_equal (remove (car lst1) lst1) (remove (car lst1) lst2)))
    )
)


; Задание 3

(defvar table 
    (list (cons "Country1" "Capital1")
          (cons "Country2" "Capital2")
          (cons "Country3" "Capital3")
          (cons "Country4" "Capital4")
    )
)


(defun get_capital (table country)
    (cond ((null table) Nil)
          ((equal (caar table) country) (cdar table))
          (T (get_capital (cdr table) country))
    )
)


(defun get_country (table capital)
    (cond ((null table) Nil)
          ((equal (cdar table) capital) (caar table))
          (T (get_country (cdr table) capital))
    )
)


; Задание 4

(defun remove_last (lst)
    (reverse (cdr (reverse lst)))
)

(defun swap_first_last (lst)
    (cons (first (reverse lst)) (append (cdr (remove_last lst)) (list (first lst))))
)


; Задание 5

(defun my_replace (lst pos elem)
    (setf (nth pos lst) elem)
    lst
)


(defun swap_two_element (lst pos1 pos2)
    (let ((tmp (nth pos1 lst)))
         (my_replace lst pos1 (nth pos2 lst))
         (my_replace lst pos2 tmp))
)

(swap_two_element '(1 2 3 4 5) 0 1)


; Задание 6

(defun remove_last (lst)
    (reverse (cdr (reverse lst)))
)

(defun swap_to_left (lst)
    (append (cdr lst) (list (first lst)))
)


(defun swap_to_right (lst)
    (append (list (first (reverse lst))) (remove_last lst))
)


(swap_to_right'(1 2 3 4 5))



; Задание 7

(defun is_exist (lst elem)
    (cond ((null lst) Nil)
          ((and (= (caar lst) (car elem)) (= (cadar lst) (cadr elem))) T)
          (T (is_exist (cdr lst) elem))
    )
)

(defun add_elem (lst elem)
    (if (is_exist lst elem) lst (append lst (list elem)))
)



; Задание 8



; a)
(defun mul_first (num lst)
    (cond ((null lst) nil)
          ((numberp (car lst)) (setf (car lst) (* (car lst) num)))
          (T (mul_first num (cdr lst)))
    )
    lst
)

; б)
(defun mul_first (num lst)
    (cond ((null lst) Nil)
          ((symbolp (car lst)) (cons (car lst) (f (cdr lst) num)))
          ((listp (car lst)) (cons (f (car lst) num) (f (cdr lst) num)))
          (T (cons (* num (car lst)) (f (cdr lst) num))) 
    )
)


; Задание 9

(defun check_border (num a b)
    (and (> num a) (< num b))
)


(defun select_between_rec (lst border_1 border_2 res_lst)
    (let ((elem (car lst)))
         (cond ((null lst) res_lst)
               ((check_border elem border_1 border_2) 
                (select_between_rec (cdr lst) border_1 border_2 
                  (append res_lst (list elem))))
               (T (select_between_rec (cdr lst) border_1 border_2 res_lst))
         )
    )
)


(defun select_between (lst border_1 border_2)
    (let ((res_lst ()))
         (select_between_rec lst border_1 border_2 res_lst)
    )
)
