
;; Exercise 2.4
;;
;; Here is an alternative procedural representation of paris.
;; For this representation, verify that (car (cons x y)) yields x for any objects x and y.
;; What is the corresponding definition of cdr? 

(define (cons x y)
	(lambda (m) (m x y)))
(define (car z)
	(z (lambda (p q) p)))
(define (cdr z)
	(z (lambda (p q) q)))


(display (car (cons 1 2)))
;; Value -> 1
(newline)
(display (cdr (cons 1 2)))
;; Value -> 2



;; permutation model
;; (car (cons 1 2))
;; -> (car (lambda (m) (m 1 2)))
;; -> ((lambda (m) (m 1 2)) (lambda (p q) p)) = ((f(m)) (f(p q)))
;; -> (((p q) 1 2))
;; -> (1)
