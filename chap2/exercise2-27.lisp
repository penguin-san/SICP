
(define (reverse items)
	(define (reverse-iter r-items n) 
			(if (> n (- (length items) 1))
				r-items
				(reverse-iter (cons (list-ref items n) r-items) (+ n 1))))
	(reverse-iter (list ) 0)
)
(define (deep-reverse items)
	(define (reverse-iter r-items items)
		(cond ((null? items)  r-items)
			  ((pair? (car items)) 
			  		(reverse-iter 
						(cons (reverse-iter '() (car items)) r-items)
					 	(cdr items)))

	    	  (else (reverse-iter (cons (car items) r-items) (cdr items)))
				))
	(reverse-iter '() items))


(define x (list (list 1 2) (list 3 4) (list 5 6)))
(display (reverse x))
(newline)
(display (deep-reverse x))
