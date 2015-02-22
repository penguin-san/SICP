(define (simpson f a b n)
	(define (h) (/ (- b a) n))
	(define (even? n)
		(= (remainder n 2) 0))
  	(define (odd? k) (not (even? k)))
	(define (yk i) (+ a (* i h))
	(define (next d) (+ d 1))

	(define (sum term a next b i n)
		(if (> i n)
			0
			(+ term(a b i)
			   (sum term a next b (+ i 1) n))))

	(define (term a b i) 
		(cond ((= i 0) (f a))
			  ((= i n) (f a))
			  ((even? n) (* 2 (f (yk i)))))
			  ((odd? n) (* 4 (f (yk i))))
			  )
		)
  	(if (even? n)
     	 ((sum term a next b 0 n)))
  	;(if (even? n) (f 2))
	
)

(define (cube x)
	(* x x x)
)

(display (simpson cube 0 1 100))
