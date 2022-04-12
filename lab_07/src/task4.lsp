; 4. (7) Напишите рекурсивную функцию, которая умножает на заданное
; число-аргумент все числаиз заданного списка-аргумента, когда
; a) все элементы списка --- числа,
; 6) элементы списка -- любые объекты.


(defun move-to (lst result)
    (cond ((null lst) result)
          (T (move-to (cdr lst) (cons (car lst) result)))
    )
)


(defun my-reverse (lst)
    (move-to lst ())
)

; а)
(defun mul-num-rec (lst num result)
    (cond ((null lst) result)
          (T (mul-num-rec (cdr lst) num (cons (* (car lst) num) result)))
    )
)


(defun mul-num (lst num)
    (my-reverse (mul-num-rec lst num ()))
)


; б)
(defun mul-num-rec (lst num result)
    (cond ((null lst) result)
          ((symbolp (car lst)) 
                (mul-num-rec (cdr lst) num (cons (car lst) result)))
          ((numberp (car lst)) 
                (mul-num-rec (cdr lst) num (cons (* (car lst) num) result)))
          (T (mul-num-rec (cdr lst) num 
                (cons (my-reverse (mul-num-rec (car lst) num ())) result)))
    )
)


(defun mul-num (lst num)
    (my-reverse (mul-num-rec lst num ()))
)
