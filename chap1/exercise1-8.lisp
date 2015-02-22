(define (cube-root prev-guess guess x)
	(if (good-root-enough? prev-guess guess)
		(display guess)
		(cube-root guess (improve guess x) x)
	)
)
(define (improve guess x) 
	(average guess (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)))
(define (average x y)
	(/ (+ x y) 2))

(define (good-root-enough? prev-guess guess)
	(< (/ (abs (- guess prev-guess)) guess) 0.001)
)
(define (square x) (* x x))

(cube-root 0.0 1.0 8)


