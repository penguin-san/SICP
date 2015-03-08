

(define (accumulate op init sequence)
	(if (null? sequence)
		init
		(op (car sequence)
			(accumulate op init (cdr sequence)))))

(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		'()
		(cons (accumulate op init seqs)
			  (accumulate-n op init (cdr seqs)))))

(display (accumulate-n + 0 (list 
								(list 1 2 3)
								(list 4 5 6)
								(list 7 8 9)
								(list 10 11 12))))
