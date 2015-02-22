
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divides? test-divisor n) test-divisor)
		  (else (find-divisor n (+ test-divisor 1)))
	)
)
(define (divides? a b) (= (remainder b a) 0))
(define (square n) (* n n))

(display (smallest-divisor 19999))


; Run the test
; (smallest-divisor 199)
;  => 199
; (smallest-divisor 1999)
;  => 1999
; (smallest-divisor 19999)
;  => 7