(define (sqrt-root prev-guess guess x)
	(if (good-root-enough? prev-guess guess)
		(display guess)
		(sqrt-root guess (improve guess x) x)
	)
)
(define (improve guess x) 
	(average guess (/ x guess)))
(define (average x y)
	(/ (+ x y) 2))
(define (good-root-enough? prev-guess guess)
	(< (/ (abs (- guess prev-guess)) guess) 0.001)
)
(define (square x) (* x x))

(sqrt-root 0.0 1.0 9898989898989898)


very large number case:
	never stops running, this is because threshold is floats, this is mean very large number not to produce measurement error.

very small number case:
	result value is wrong, this is because threshold is very large number against input number

