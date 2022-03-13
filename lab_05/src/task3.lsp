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
