
;; Exercise 1.43
;;
;; If f is a numerical funciton and n is a positive integer, then we can form the nth repeated application of f.
;; which is defined to be the funciton whose value at x is f(f(...(f(x))...)).
;; For example, if f is the functino x -> x + 1, then the nth repeated application of f is the function x -> x+ n. 
;; If f is the operation of squaring a number, then the nth repeated application of f is the function that raises its argument to the 2^n th power.
;; Write a procedure that takes as inputs a procedure that computes f and a positive integer n and returns the procedure that computes the nth repeated application of f.
;; Your procedure should be able to be used as follows:
;; ((repeated square 2) 5)


(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (repeated f x)
	(compose f f 1 x)
)
(define (compose f g i k) 
	(cond ((< i k) (compose f (lambda (x) (f (g x))) (inc i) k))
		  ((= i k) (lambda (x) (g x)))
	)
)

(display ((repeated squeare 2) 5))
;; result = 625
