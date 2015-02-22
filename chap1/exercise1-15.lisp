
; question a is how many times p will be called for (sin 12.15)
; 		the answer is 5
; question b:
; 	when (sine a) is evaluated, what is the order of growth in space and number of steps.
;		number of steps : n / 3
; 		order of growth : ln(n) 
;			because : n = 12  12/3 = 4 
;			

(define (ab x)
	(cond ((> x 0) x)
		  ((= x 0) 0)
		  ((< x 0) (- x)))
)
(define pai 3.14159265)

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
	(if (not (> (abs angle) 0.1))
		angle
		(p (sine (/ angle 3.0))))
)

(display (sine (/ pai 4)))

