
;; Exercise2-2
;;
;; Consider the problem of representing line segments in a plane.
;; Each segment is represented as a pair of points: a starting point and an ending point.
;; Define a constructor make-segment and selectors start-segment and end-segment that define a constructor make-segment and selectors start-segment and end-segment that define the representation of segments in term of points.
;; Furthermore, a point can be represented as a pari of numbers: the x coordinate nad the y coordinate.
;; Accordingly, specify a constuctor make-point and selectors x-point and y-point that define this representation.
;; Finally, using your selectors and constructors, define a procedure midpoint-segment that takes a line segment as argument and returns its midpoint (the point whose coordinates are the average of the coordinates of the endpoints)

(define (midpoint-segment seg)
	(let ((s-p (start-segment seg))
		  (e-p (end-segment seg)))
	
		(make-point 
			(/ (+ (x-point s-p) (x-point e-p)) 2)
			(/ (+ (y-point s-p) (y-point e-p)) 2)
		))
)

(define (make-segment start-point end-point)
	(cons start-point end-point))

(define (start-segment s)
	(car s))
(define (end-segment s)
	(cdr s))

; --------- abstract barrier ---------
(define (make-point x y) (cons x y))
(define (x-point x) (car x))
(define (y-point y) (cdr y))

(define (print-point p)
	(newline)
	(display "(")
	(display (x-point p))
	(display ",")
	(display (y-point p))
	(display ")")
)

(define s-p (make-point 2 2))
(define e-p (make-point 4 4))

(define seg (make-segment s-p e-p))
(print-point (midpoint-segment seg))
; Value -> (3, 3)

