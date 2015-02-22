
;; Exercise 2-3
;; 
;; Implement a representation for rectangles in a plane.(hint: You may want to make use of exercise 2.2)
;; In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle.
;; Now implement a different representation for rectangles.
;; Can you design your system with suitable abstraction barriers, so that the same perimeter and area procedures will work using either representation?

(define (perimeter seg)
	(let ((s-p (start-segment seg))
		  (e-p (end-segment seg)))
		
		(* 2 (+ (abs (- (y-point e-p) (y-point s-p)))
		   	    (abs (- (x-point e-p) (x-point s-p))))))
)
(define (area-rectangle seg)
	(let ((s-p (start-segment seg))
		  (e-p (end-segment seg)))
		
		(* (abs (- (y-point e-p) (y-point s-p)))
		   (abs (- (x-point e-p) (x-point s-p)))))
)

;; -------- abstract barrier ---------
(define (make-rect start-point end-point)
	(cons start-point end-point))

(define (start-segment s)
	(car s))
(define (end-segment s)
	(cdr s))

;; -------- abstract barrier ---------
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

;; -----------------------------------


;; calculate perimeter and area of the rectangle used 2 points
(define s-p (make-point 2 0))
(define e-p (make-point 0 5))

(define seg (make-rect s-p e-p))
(display "perimeter = ")
(display (perimeter seg))
(newline)
(display "area-rectangle = ")
(display (area-rectangle seg))

;; case 1
;; Value -> 
;; s-point = (0, 2)
;; e-point = (5, 0)
;; perimeter = 14
;; area-rectangle = 10

;; case 2
;; Value -> 
;; s-point = (2, 0)
;; e-point = (0, 5)
;; perimeter = 14
;; area-rectangle = 10

