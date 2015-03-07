

(define (count-change amount) (cc amount 3)) 
(define (cc amount coins)
	(cond ((= amount 0) 1)
		  ((or (< amount 0) (null? coins)) 0)
		  (else (+ (cc amount (cdr coins)) 
		  	 	   (cc (- amount (car coins)) coins)
				)
		  )
	))

(define us-coins (list 25 10 5 1 50))
(display (cc 100 us-coins) )
