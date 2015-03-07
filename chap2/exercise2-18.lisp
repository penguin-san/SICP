

(define (length items)
	(define (length-iter a count)
		(if (null? a)
			count
			(length-iter (cdr a) (+ 1 count))
		)
	)
	(length-iter items 0)
)

(define (last-pair items)
	(let ((l (length items)))
		  (list-ref items (- l 1)))
)

(define (list-ref items n)
	(if (= n 0)
		(car items)
		(list-ref (cdr items) (- n 1))
	)
)
(define (append list1 list2)
	(if (null? list1)
		list2
		(cons (car list1) (append (cdr list1) list2))
	)
)

(define (reverse items)
	(define (reverse-iter r-items n) 
			(if (> n (- (length items) 1))
				r-items
				(reverse-iter (cons (list-ref items n) r-items) (+ n 1))))
	(reverse-iter (list ) 0)
)

(display (reverse (list 23 72 149 34)))
