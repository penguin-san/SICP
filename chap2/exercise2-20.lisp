
(define (same-parity x . items)
	(define (even? n) (= (remainder n 2) 0))
	(define (odd? n) (= (remainder n 2) 1))

	(define (filter func)
		(define (filter-iter input result) 
			(if (null? input) 
				result
				(if (func (car input))
					(filter-iter (cdr input) (append result (list (car input))))
					(filter-iter (cdr input) result)
				)
			)
		)
		(filter-iter items (list x))
	)
	(if (even? x) 
		(filter even?)
		(filter odd?)
	)
)

(display (same-parity 2 3 4))
