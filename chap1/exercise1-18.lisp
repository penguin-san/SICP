
(define (multi a b s) 
	(cond ((= b 0) s)
		  ((even? b) (multi (double a) (halve b) s))
		  (else (multi a (- b 1) (+ a s)))
	)
)

(define (even? n) (= (% n 2) 0))
(define (double n) (* n 2))
(define (halve n) (/ n 2))

(display (multi 3 8 0))
