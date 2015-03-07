
(define (for-each func list-in)
	(define (for-each-iter items answer)
		(if (null? items)
			'nil
			(for-each-iter (cdr items) (func (car items)))
		)
	)
	(for-each-iter list-in '())
)

(for-each (lambda (x)
			(newline)
			(display x))
		  (list 1 2 3 4))

