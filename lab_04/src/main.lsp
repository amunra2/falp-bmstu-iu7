; Задание 5

(defvar player1)
(defvar player2)
(setf player1 "user")
(setf player2 "computer")

(defvar dice1)
(defvar dice2)
(defvar tmp_dice)


(defun roll_dice() 
    (+ (random 6) 1)
)
(defun roll_dices() 
    (list (roll_dice) (roll_dice))
)

(defun sum_points(dice) 
    (+ (car dice) (cadr dice))
)

(defun is_win(dice) 
    (cond ((= (sum_points dice) 7) T) ((= (sum_points dice) 11) T) )
)

(defun is_repeat(dice)
    (cond ((= (car dice) (cadr dice) 1) T) ((= (car dice) (cadr dice) 6) T) )
)

(defun is_player_won(result) 
    (= (cadr result) 1)
)

(defun print_res (player dice) 
    (format Nil "Win ~a, points = ~a, sum = ~a" player (car dice) (sum_points (car dice)))
)


(defun print_info (player dice) 
    (format Nil "Player: ~a, points = ~a, sum =  ~a" player dice (sum_points dice))
)


(defun player_move (player)
    (setf tmp_dice (roll_dices))
    (print_info player tmp_dice)
    (cond ((is_win tmp_dice) (list tmp_dice 1))
          ((is_repeat tmp_dice) (player_move player))
          (T (list tmp_dice 0)))
)


(defun start_game()
    (setf dice1 (player_move player1))
    (if (is_player_won dice1) (print_res player1 dice1)
        (and (setf dice2 (player_move player2))
        (cond ((is_player_won dice2) (print_res player2 dice2))
              ((> (sum_points (car dice1)) (sum_points (car dice2))) (print_res player1 dice1))
              ((< (sum_points (car dice1)) (sum_points (car dice2))) (print_res player2 dice2)) 
              ((format Nil "Draw")) )))
)
