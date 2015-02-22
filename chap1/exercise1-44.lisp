
;; Exercise 1.44
;;
;; The idea of smoothing a function is an important concept in signal processing.
;; If f is a function and dx is some small number, then the smoothed version of f is the function whose value at a point x is the average of f(x-dx), f(x), and f(x+dx)/
;; Write a procedure smooth that takes as input a procedure that computes f and returns a procedure that computes the smoothed f.
;; It is sometimes valueable to repeatedly smooth a function(that is,smooth the smoothed cuntion, and so on) to obtained the n-fold smoothed function.
;; Show how to generate the n-fold smoothed funtion of any given function using smooth and repeated from exercise 1.43


(define dx 0.00000001)
(define (inc x) (+ x 1))
(define (smoothing f)
	(lambda (x) 
		(/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
)

(define (repeated f x)
	(compose f f 1 x)
)
(define (compose f g i k) 
	(cond ((< i k) (compose f (lambda (x) (f (g x))) (inc i) k))
		  ((= i k) (lambda (x) (g x)))
	)
)
(define (n-fold x)
	(repeated smoothing x)
)

(display (sin 4))
(newline)
;; Value -> -0.7568024953079282
(display ((smoothing sin) 4))
(newline)
;; Value -> -0.7568024953079281
(display (((n-fold 10) sin) 4))
;; Value -> -0.7568024953079281
