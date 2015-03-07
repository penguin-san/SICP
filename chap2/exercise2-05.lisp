
;; Exercise 2.5
;; 
;; Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair a and b as the integer that is the product 2^a3^b.
;; Give the corresponding definitions of the procedures cons, car,and cdr

(define (power x n)
    (if (= n 1)
	       x
		(* x (power x (- n 1)))))
(define (inc x) (+ x 1))
(define (cons x y)
	(* (power 2 x) (power 3 y))
)
(define (car z)
	(define (cal value i)
		(if (= (remainder value 2) 1)
			i
			(cal (/ value 2) (inc i))
		)
	)
	(cal z 0)
)
(define (cdr z)
	(define (cal value i)
		(if (or (= (remainder value 3) 1) (= (remainder value 3) 2))
			i
			(cal (/ value 3) (inc i))
		)
	)
	(cal z 0)
)


(display (car (cons 3 3)))
;; value -> 3
(newline)
(display (cdr (cons 3 3)))
;; Value -> 3
