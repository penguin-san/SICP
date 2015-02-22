
(define (new-if predicate then-clause else-clause) 
	(display 0)
	(cond (predicate then-clause)
		  (else else-clause)))

(define (sqrt-iter guess x) (new-if (< 0 1)
	(display guess)
	(sqrt-iter (improve guess x) x)))

(define (improve guess x) 
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))
(define guess 1.0)
(define x 2)

(new-if (good-enough? guess x) 
	(display guess)
	(display 99999))



answer :
	It maybe occur infinite loop. because this interpreeter used applicative-order, so occure infinite loop
