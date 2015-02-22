(define (pascal n k)
	(/ (factorial n) (* (factorial (- n k)) (factorial k)))
)

(define (factorial n)
	(if (< n 1)
		1	
		(* n (factorial (- n 1)))
	)
)
(display (pascal 10 8))
