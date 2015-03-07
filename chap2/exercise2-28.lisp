
(define (fringe x)
	(define (fringe-iter y)
		(cond ((number? y) (list y))
			  ((pair? y) (append (fringe-iter (car y)) (fringe-iter (cdr y))) )
			  (else '())
		)
	)
	(fringe-iter x)
)
(define x (list (list 1 2 3) (list 3 4) (list 5 7)))
(display (fringe x) )

