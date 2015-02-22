(define (f n)
	(if (< n 3)
		n
		(+ (f (- n 1)) (* 2(f (- n 2))) (* 3(f (- n 3))))
	)
)

(define (f-p n goal f-first f-second f-third)
	(cond ((= n goal) (+ f-first (* f-second 2) (* f-third 3)))
		  ((< n 3) (f-p (+ n 1) goal n f-first f-second))
		  (else (f-p (+ n 1) goal (+ (* f-first 1) (* f-second 2) (* f-third 3)) f-first f-second))
	)
)

(display (f 7))
(display (f-p 1 7 0 0 0))
