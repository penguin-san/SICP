
(define (inc x) (+ x 1))
(define (identify x) x)
(define (accumulate_recursive combiner null-value term a next b) 
	(if (> a b)
		null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b))
	)
)
(define (accumulate_iterative combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner result (term a)))
		)
	)
	(iter a null-value)
)

(define (sum term a next b)
	(accumulate + 0 term a next b)
)
(define (product term a next b)
	(accumulate * 1 term a next b)
)

;(display (accumulate + 0 identify 1 inc 10))
(display (accumulate_iterative * 1 identify 1 inc ))
