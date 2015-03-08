
(define (times x n)
	(define (time-iter k)
		(if (<= n k)
			x
			(* x (time-iter (+ k 1)))))
	(time-iter 1))

(define (accumulate op init sequence)
	(if (null? sequence)
		init
		(op (car sequence)
			(accumulate op init (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
	(accumulate (lambda (this-coeff higher-terms) 
					(+ this-coeff (* x higher-terms)))
				 0
				 coefficient-sequence)
	)


(display (horner-eval 2 (list 1 3 0 5 0 1)))
(newline)


