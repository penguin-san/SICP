
;; Exercise 2.6

;; In case representing pairs as procedures wasn't mind-boggling enough, consider that, in a languag that can manipulate procedures, we can get by without numbers(at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as
;; This representation is know as church numerals, after its inventor, Alonzo Church the logician who invented the λ calculus.
;; Define one and two directly(not in terms of zero and add-1)

(define (inc n)
	(+ n 1))
(define (to-s z)
	((z inc) 0))

(define zero (lambda (f) (lambda (x)  x)))
(define one  (lambda (f) (lambda (x) (f  x))))
(define two  (lambda (f) (lambda (x) (f (f x)))))
(define (add-1 n)
	(lambda (f) (lambda (x) (f ((n f)) x))))

(display (to-s zero))
;; Value => 0
(newline)
(display (to-s one))
;; Value => 1
(newline)
(display (to-s two))
;; Value => 2

