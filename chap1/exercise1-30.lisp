
(define (inc x) (+ x 1))
(define (identify x) x)
(define (cube x) (* x x x))

(define (sum term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (+ result (term a)))
		)
	)
	(iter a 0)
)

(display (sum cube 1 inc 10))
