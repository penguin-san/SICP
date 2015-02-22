
(define (p) (p))
(define (test x y)
(if (= x 0) 0 y))

(test 0 (p))


result :
	applicative-order:
		(test 0 (p))
		(test 0 (p))
			(if 0 0)
				0
	
	normal-order:
		(test 0 (p))
		called (define (p) (p))
		called (define (p) (p))
		......

