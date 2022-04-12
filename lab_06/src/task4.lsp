; 4. Написать предикат set-equal, который возвращает t, если два его 
; множества-аргумента содержат одни и те же элементы, 
; порядок которых не имеет значения.


; Функционал
(defun my-subsetp (set1 set2)
    (reduce #'(lambda (prev_res1 elem1)
                    (and prev_res1 (reduce #'(lambda (prev_res2 elem2)
                                                (or prev_res2 (equal elem1 elem2))
                                             ) set2 :initial-value Nil))
              ) set1 :initial-value T)
)

(defun set-equal (lst1 lst2)
    (and (my-subsetp lst1 lst2) (my-subsetp lst2 lst1))
)



; Рекурсия
(defun my-remove (elem lst)
    (cond ((null lst) Nil)
          ((equal (car lst) elem) (my-remove elem (cdr lst)))
          (T (cons (car lst) (my-remove elem (cdr lst))))
    )
)


(defun set-equal (lst1 lst2)
    (cond ((and (null lst1) (null lst2)) T)
          (T (set-equal (my-remove (car lst1) lst1) (my-remove (car lst1) lst2)))
    )
)
