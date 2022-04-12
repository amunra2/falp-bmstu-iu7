; 3. написать функцию, которая по своему списку-аргументу lst
; определяет, является ли он палиндромом
; (то есть равны ли lst и (reverse lst)).


; Функционал
(defun palindrom-func (lst rev_lst)
    (mapcar #'(lambda (elem1 elem2) (equal elem1 elem2)) lst rev_lst)
)


(defun palindrom (lst)
    (eval `(and ,@(palindrom-func lst (reverse lst))))
)

; или

(defun palindrom (lst)
    (reduce #'(lambda (elem1 elem2) (and elem1 elem2)) 
                            (palindrom-func lst (reverse lst)))
)



; Рекурсия
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