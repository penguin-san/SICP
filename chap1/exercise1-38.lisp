;;author by itosou
;; Exercise 1.38:
;; 
;; In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus Continuis, which included a continued fraction expansion for e - 2.
;;  where e is the base of the natural logarithms.
;; In this fraction, the Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8...
;; Write a program that uses your cont-frac procedure form exercise 1.37 to approximate e, based on Euler's expansion


(define init 0)
(define (cont-frac n d k) 
	(define (sum-recu i term)
		(if (> i k)
			(term init)
			(/ n (+ (ex-d i) (sum-recu (+ i 1) term)))
		)
	)
	(sum-recu 1 (lambda (x) (/ n (+ (ex-d 1) x))))
)
(define (ex-d x)
	(cond ((= x 2) 2)
		  ((= (remainder (- x 5) 3) 0) (* 2 (+ 1 (quotient x 3))))
		  (else 1)
	)
)
(display (exact->inexact (cont-frac 1 (ex-d 1) 10)))

;; result
;; 0.7182823682498374
