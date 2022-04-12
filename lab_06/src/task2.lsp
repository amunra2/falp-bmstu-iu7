; 2. Напишите функцию, которая умножает на заданное
; число-аргумент все числа из заданного списка-аргумента, когда
; а) все элементы списка --- числа; 
; б) элементы списка -- любые объекты.


; Функционал

; а)
(defun mul-num (lst num)
    (mapcar #'(lambda (elem) (* elem num)) lst)
)


; б)
(defun mul-num (lst num)
    (mapcar #'(lambda (elem) (cond ((listp elem) (mul-num elem num))
                                   ((numberp elem) (* elem num))
                                   (T elem)
                             )
              ) lst
    )
)



; Рекурсия (только для первого числа)

; a)
(defun mul-first (num lst)
    (cond ((null lst) Nil)
          (T (cons (* (car lst) num) (mul-first num (cdr lst))))
    )
)

; б)
(defun mul-first (num lst)
    (cond ((null lst) Nil)
          ((symbolp (car lst)) (cons (car lst) (mul-first (cdr lst) num)))
          ((listp (car lst)) (cons (mul-first (car lst) num) (mul-first (cdr lst) num)))
          (T (cons (* num (car lst)) (mul-first (cdr lst) num))) 
    )
)