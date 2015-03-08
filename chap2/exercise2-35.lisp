
(define (accumulate op init sequence)
	(if (null? sequence)
		init
		(op (car sequence)
			(accumulate op init (cdr sequence)))))

(define (count-leaves t)
	(accumulate (lambda (x y) (+ x y)) 0 
					(map (lambda(x) 
							(if (pair? x) 
								(count-leaves x)
								1))
							t)))

(display (count-leaves (list 1 2 (list 3 4))))
