: 自分の解答

(define (fast-expt-repetition b n a)
	(cond ((= a 1) (init b n))
		  ((= n 1) a)
		  (else (fast-expt-repetition b (- n 1) (* b a)))
	)
)
(define (init b n)
	(if (even? n) 
		(fast-expt-repetition (* b b) (/ n 2) (* b b))
		(* b (fast-expt-repetition (* b b) (/ (- n  1) 2) (* b b)))
	)
		
)
(define (even? n)
	(= (remainder n 2) 0))

(display (fast-expt-repetition 2 4 1))
