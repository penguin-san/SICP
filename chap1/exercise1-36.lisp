;; author by itosou
;;
;; Exercise 1.36 :
;; Modify fixed-point so that it prints the sequence of approximations it generates, using the newline and display primitives show in exercise 1.22.
;; Then find a solution to x^x = 1000 by finding a fixed point of x -> log(1000)/log(x).
;; (Use Scheme's primitive log procedure, which computes natural logarithms) 
;; Compare the number of steps this takes with and without average damping.(Note that you cannot start fixed-point with a guess of 1, as this would cause division by log(10 = 0
;;


(define (close-enough? x y) (< (abs (- x y)) 0.001))
(define tolerance 0.00001)
(define (average x y) (/ (+ x y) 2))
(define (fixed-point f first-guess)
	(define (close-point v1 v2)
		(< (abs (- v1 v2)) tolerance)
	)
	(define (try guess number)
		(let ((next (f guess)))
		(display "Guess number ")
		(display number)
		(display " :  ")
		(display next)
		(newline)
			(if (close-enough? guess next)
				next
				(try next (+ number 1))
			))
	)
	(try first-guess 1)
)

(display "use average damping")
(newline)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 10)
(newline)

;; use average dampins
;; Guess number 1 :  6.5
;; Guess number 2 :  5.095215099176933
;; Guess number 3 :  4.668760681281611
;; Guess number 4 :  4.57585730576714
;; Guess number 5 :  4.559030116711325
;; Guess number 6 :  4.55613168520593
;; Guess number 7 :  4.555637206157649

(display "not use average damping")
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 10)

;; dont use average damping number 
;; Guess number 1 :  2.9999999999999996
;; Guess number 2 :  6.2877098228681545
;; Guess number 3 :  3.7570797902002955
;; Guess number 4 :  5.218748919675316
;; Guess number 5 :  4.1807977460633134
;; Guess number 6 :  4.828902657081293
;; Guess number 7 :  4.386936895811029
;; Guess number 8 :  4.671722808746095
;; Guess number 9 :  4.481109436117821
;; Guess number 10 :  4.605567315585735
;; Guess number 11 :  4.522955348093164
;; Guess number 12 :  4.577201597629606
;; Guess number 13 :  4.541325786357399
;; Guess number 14 :  4.564940905198754
;; Guess number 15 :  4.549347961475409
;; Guess number 16 :  4.5596228442307565
;; Guess number 17 :  4.552843114094703
;; Guess number 18 :  4.55731263660315
;; Guess number 19 :  4.554364381825887
;; Guess number 20 :  4.556308401465587
;; Guess number 21 :  4.555026226620339
;; Guess number 22 :  4.55587174038325

