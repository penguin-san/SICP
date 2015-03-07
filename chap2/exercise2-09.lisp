
;; Exercise 2.9
;;
;; The width of an interval is half of the difference between its upper and lower bounds.
;; The width is a measure of the uncertainty of the number specified by the interval.
;; For some arithmetic operations the width of the resule of combining two intervals is a function only of the widths of the argument intervals, whereas for others the width of the combination is not a function of the widths of the widths of the intervals being added (or subtracted).
;; Give examples to show that this is not true for multiplication or division
(define (width-of-interval x)
	(/ (- (upper-bound x) (lower-bound x)) 2.0)
	)

(define (add-interval x y)
	(make-interval (+ (lower-bound x) (lower-bound y))
				   (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
	(make-interval (- (lower-bound y) (upper-bound x))
				   (- (upper-bound y) (lower-bound x)))
)

(define (mul-interval x y)
	(let ((p1 (* (lower-bound x) (lower-bound y)))
		  (p2 (* (lower-bound x) (upper-bound y)))
		  (p3 (* (upper-bound x) (lower-bound y)))
		  (p4 (* (upper-bound x) (upper-bound y))))
		  
		  	(make-interval (min p1 p2 p3 p4)
						   (max p1 p2 p3 p4))
		  ))
(define (div-interval x y)
	(mul-interval
	 x
	 (make-interval (/ 1.0 (upper-bound y))
	 				(/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
(define (print x) 
		(display "(")
		(display (cdr x))
		(display ", ")
		(display (car x))
		(display ")")
		(newline))

(define s-p (make-interval 3 5))
(define e-p (make-interval 7 13))

(display (width-of-interval s-p))
(newline)
(display (width-of-interval e-p))
(newline)

;; sub check
(define sub (sub-interval s-p e-p))
(print sub)
(display (width-of-interval sub))
(newline)

;; add check
(define add (add-interval s-p e-p))
(print add)
(display (width-of-interval add))
(newline)

;; multipul check
;; width of interval = dx - dy
;; if small = x_u * y_l
;;    big   = x_l * y_u
;; these numeric is not only dx, or dy.
;; because, mul's widht is wrong
(define mul (mul-interval s-p e-p))
(print mul)
(display (width-of-interval mul))
(newline)

;; Division check
;; width 0f interval
;; same mul's reason
(define div (div-interval s-p e-p))
(print div)
(display (width-of-interval div))

