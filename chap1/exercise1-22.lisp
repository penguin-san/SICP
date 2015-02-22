
(define (timed-prime-test n)
		(newline) (display n) (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (prime? n)
		(report-prime (- (runtime) start-time)))
)
(define (report-prime elapsed-time)
	(display " ***  ") (display elapsed-time))

(define (prime? n)
	(= n (smallest-divisor n)))

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
	              (+ (* a 1000000) b)))

(display (timed-prime-test 199))
