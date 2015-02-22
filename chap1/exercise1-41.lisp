
;; Exercise1-41.lisp
;; Define a procudure double that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice.
;; For example, if inc is a procedure that adds 1 to its argument, then (double inc) should be a procedure that adds 2. What value is return by
;; (((double (double double)) inc ) 5)

(define (inc x) (+ x 1))
(define (double f)
	(lambda (x) (f (f x)))
)

(display ((double inc) 1) )
;; result 3

(display (((double (double double)) inc) 5))
;; result 16
