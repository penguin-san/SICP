
;; Exercise1.45
;;
;; We saw in section 1.3.3 that attempting to sompute square roots by naively finding a fixed point of y -> x/y does not converge, and that this can be fixed by average damping.
;; The same method works for finding cube roots as fixed points of the average-damped y -> x/y^2.
;; Unfortunately, the process does not work for fourth roots -- a single average damp is not enough to make a fixed-point search for y-> x/y^3 congerge.
;; On the other hand, if we average damp twice(i.e., use the average damp of the average damp of y -> x/y^3) the fixed-point search does converge.
;; Do some experiments to determine how many average damps are required to compute nth roots as a fixed-point search based upon repeated average damping of y -> x/y^n-1.
;; Use this to implement a simple procedure for coputing nth roots using fixed-point ,average-damp and repeated procedure of exercise1.43.
;; Assume that any arithmetic operations you need are availabel as primitives


(define (inc x) (+ x 1))
(define (repeated f x)
	(compose f f 1 x)
)
(define (compose f g i k) 
	(cond ((< i k) (compose f (lambda (x) (f (g x))) (inc i) k))
		  ((= i k) (lambda (x) (g x)))
	)
)
(define (close-enough? x y) (< (abs (- x y)) 0.001))
(define tolerance 0.00001)
(define (average x y) (/ (+ x y) 2))

(define (fixed-point f first-guess)
	(define (close-point v1 v2)
		(< (abs (- v1 v2)) tolerance)
	)
	(define (try guess number)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next (+ number 1))
			))
	)
	(try first-guess 1)
)
(define (fixed-point-root g f guess)
	(fixed-point (f g) guess)
)
(define (power x n)
    (if (= n 1)
	       x
		(* x (power x (- n 1))))
)
(define (average-dump f) 
	(lambda (x) (average x (f x)))
)
(define (n-root n x)
	(fixed-point-root 
		(lambda (y) (/ x (power y (- n 1))))
		(repeated average-dump (floor (/ (log n) (log 2))))
		1.0
	)
)

(display (n-root 20 1024))
;; Value -> 1.4141542058604397
