
(define (multi a b)
	(cond ((= b 0) 0)
		((even? b) (double (multi a (halve b))))
		(else (+ a (multi a (- b 1))))
	)
)
(define (double n)
	(* n 2))
(define (halve n)
	(/ n 2))

(define (even? n)
	(= (reminder n 2) 0))

(display (multi 3 5 ))
