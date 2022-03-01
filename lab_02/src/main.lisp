; Задание 2
; Написать функцию, вычисляющую гипотенузу прямоугольного треугольника 
; по заданным катетам и составить диаграмму её вычисления.

(defun hypotenuse (a b) (sqrt (+ (* a a) (* b b))))
; (HYPOTENUSE 3 4) -> 5.0


; Задание 3
; Написать функцию, вычисляющую объем параллелепипеда по 3-м его
; сторонам, и составить диаграмму ее вычисления.

(defun volume (a b c) (* a (* b c)))
; (volume 4 4 4) -> 64


; Задание 4
; Каковы результаты вычисления следующих выражений? 
; (объяснить возможную ошибку и варианты ее устранения)

(list 'a c) ; The variable C is unbound.
(cons 'a (b c)) ; The variable C is unbound.
(cons 'a '(b c)) ; (A B C)
(caddy (1 2 3 4 5)) ; Undefined function: CADDY
(cons 'a 'b 'c) ; invalid number of arguments: 3
(list 'a (b c)) ; The variable C is unbound.
(list a '(b c)) ; The variable A is unbound.
(list (+ 1 '(length '(1 2 3)))) ; The value (LENGTH '(1 2 3)) is not of type NUMBER

; Исправления

(list 'a 'c) ; (A C)
(cons 'a '(b c)) ; (A B C)
(cons 'a '(b c)) ; (A B C)
(caddr '(1 2 3 4 5)) ; 3
(cons 'a 'b) ; (A B)
(list 'a '(b c)) ; (A (B C))
(list 'a '(b c)) ; (A (B C))
(list (+ 1 (length '(1 2 3)))) ; (4)


; Задание 5
; Написать функцию longer_then от двух списков-аргументов, которая 
; возвращает Т, если первый аргумент имеет большую длину.

(defun longer (a b) (cond ((> (length a) (length b)) T) (Nil)))
; (longer '(a b) '(a)) -> T
; (longer '(a) '(a)) -> Nil
; (longer '(a) '(a b)) -> Nil


; Задание 6
; Каковы результаты вычисления следующих выражений?

(cons 3 (list 5 6)) ; (3 5 6)

(list 3 'from 9 'lives (-9 3)) ; illegal function call
; Fix: (list 3 'from 9 'lives '(-9 3)) -> (3 FROM 9 LIVES (-9 3))

(+ (length for 2 too))(car '(21 22 23))) ; The variable FOR is unbound.
; Fix: (+ (length '(for 2 too))(car '(21 22 23))) ; 24

(cdr '(cons is short for ans)) ; (IS SHORT FOR ANS)

(car (list one two)) ; The variable ONE is unbound.
; Fix: (car (list 'one 'two)) -> ONE

(cons 3 '(list 5 6)) ; (3 LIST 5 6)

(car (list 'one 'two)) ; ONE


; Задание 7
; Дана функция (defun mystery (x) (list (second x) (first x))).
; Какие результаты вычисления следующих выражений?

(mystery (one two)) ; The variable TWO is unbound.
; Fix: (mystery '(one two)) -> (TWO ONE)
(mystery (one 'two)) ; The function COMMON-LISP-USER::ONE is undefined.
(mystery (last one two)) ; The variable ONE is unbound.
(mystery free) ; The variable FREE is unbound.


; Задание 8
; Написать функцию, которая переводит температуру в системе Фаренгейта 
; температуру по Цельсию (defun f-to-c (temp)...). 
; Формулы: c = 5 / 9 * (f - 32.0); f = 9 / 5 * c + 32.0. 
; Как бы назывался роман Р.Брэдбери "+451 по Фаренгейту" в системе по Цельсию?

(defun f-to-c (temp) (* 5/9 (- temp 32.0)))
; (f-to-c 451) -> 232.77779


; Задание 9
; Что получится при вычисления каждого из выражений?

(list 'cons t nil) ; (CONS T NIL)
(eval (list 'cons t NIL)) ; (T)
(eval (eval (list 'cons t NIL))) ; The function COMMON-LISP:T is undefined.
(apply #cons ''(t NIL)) ; illegal complex number format: #CONS
; Fix: (apply #'cons '(t NIL)) -> (T)
(eval Nil) ; Nil
(list 'eval Nil) ; (EVAL NIL)
(eval (list 'eval Nil)) ; NIL

; Дополнительное задание
; Задание 1
; Написать функцию, вычисляющую катет по заданной гипотенузе и другому
; катету прямоугольного треугольника, и составить диаграмму ее вычисления.

(defun catet (b c) (sqrt (- (* c c) (* b b))))
; (catet 4 5) -> 3.0

; Задание 2
; Написать функцию, вычисляющую площадь трапеции по ее основаниям и высоте,
; и составить диаграмму ее вычисления.

(defun trap_square (a b h) (* (/ (+ a b) 2) h))
; (trap_square 2 3 1) -> 5/2