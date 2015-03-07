
(define (width-of-interval x)
	(if (= (- (upper-bound x) (lower-bound x)) 0)
		(display "width of interval is 0")
		(/ (- (upper-bound x) (lower-bound x)) 2.0)
	))

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

(define s-p (make-interval 3 3))
(define e-p (make-interval 7 13))


(width-of-interval s-p)
