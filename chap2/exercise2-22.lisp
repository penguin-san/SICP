
(define (square n) (* n n))
(define (square-list items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				  (cons (square (car things)) answer))
		)
	)
	(iter items (list ))
)

(display (square-list (list 1 2 3)))
;; because 
;; (iter (2 3) (cons 1 (list )))
;; (iter (3)   (cons 4 (list 1)))
;; (iter ()    (cons 9 (list 4 1)))

(newline)
(define (square-list2 items)
	(define (iter things answer)
		(if (null? things)
			answer
			(iter (cdr things)
				  (cons answer (square (car things))))
		)
	)
	(iter items (list ))
)
(display (square-list2 (list 1 2 3)))
;; becase 
;; (iter (2 3) (cons (list ) 1))
;; (iter (3)   (cons (list (list ). 1) 4))
;; (iter ()    (cons (list (list ). 1) .4 ) 9)
