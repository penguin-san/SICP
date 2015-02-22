
;; Exercise2-1
;;
;; Define a better version of make-rat that handles both positive and negative arguments.
;; Make-rat should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the ratinal number is negative, only the numerator is negative

(define (print-rat x)
	(display (numer x))
	(display "/")
	(display (denom x))
)

(define (numer x) (car x))
(define (denom x) (cdr x))
(define (make-rat n d)
	(cond ((< d 0) 
			(let ((g (gcd n d)))
				(cons (/ (- n (* 2 n)) g) (/ (abs d) g)))
			)
		  ((> d 0)
			(let ((g (gcd n d)))
				(cons (/ n g) (/ d g)))
			)
		  )
)

(define test (make-rat 2 5))
(print-rat test)
; Value -> 2/5

(define nega (make-rat 2 -5))
(print-rat nega)
; Value -> -2/5

(define nega-denom (make-rat -2 5))
(print-rat nega-denom)
; Value -> -2/5

(define nega-both (make-rat -2 -5))
(print-rat nega-both)
; Value -> 2/5
