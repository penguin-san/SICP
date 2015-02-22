;; author bt itosou
;;
;; Exercise 1.39:
;;
;; A continued fraction representation of the tangent function was published in 1770 by the German mathematician J H Lambert

;; where x is tn radians.
;; Define a procefure (tan-cf x k) that computes an approximation to the tangent function based on Lambert's formula.
;; K specifies the number of terms to compute, as in exercise1-37

(define (tan-cf x k)
	(define (tanx i) 
		(if (> i k)
			(/ (* x x) (odd i))
			(/ x (- (odd i) (tanx (+ i 1)))) 
		)
	) 
	(tanx 1)
)
(define (odd x)
	(- (* 2 x) 1)
)

(display (exact->inexact (tan-cf 1 5)))

;; result
;; >> 1.557407722401769 
