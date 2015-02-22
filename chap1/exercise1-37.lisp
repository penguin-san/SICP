;; author by itosou
;; Exercise 1.37 :
;;
;; An an example, one can show that the infinite continued fraction expansion with the Ni and the Di all equal to 1 produces 1/a, ehere a is the golden ration.
;; One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. 
;; Such a truncation -- a so-called k-term finite continued fraction -- has the form

;; Suppose that n and are procedures of one argument fraction.
;; Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction/
;; Check your procedure by approximation 1/a using
;; (cont-frac (lambda (i) 1.0)
;;			  (lambda (i) 1.0)
;;			  k )
;; for successive valued of k. How large must you make k in order to get an approzimation that is accurate to 4 decimal places?
;; b) if your cont-frac procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process

(define init 0)
(define (cont-frac n d k) 
	(define (sum-recu i term)
		(if (> i k)
			(term init)
			(/ n (+ d (sum (+ i 1) term)))
		)
	)
	(define (sum-iter value i term)
		(if (> i k)
			value
			(sum-iter (/ n (+ d value)) (+ 1 i) term)
		)
	)
	(sum-iter 0.5 1 (lambda (x) (/ n (+ d x))))
)
(display (exact->inexact (cont-frac 1 1 10)))

;; answer
;; k = 1 : 0.6666666666666
;; k = 2 : 0.6000000000000001
;; k = 3 : 0.625
;; k = 4 : 0.6153846153846154
;; k = 5 ; 0.6190476190476191
;; k = 6 : 0.6176470588235294
;; k = 7 ; 0.6181818181818182
;; k = 8 : 0.6179775280898876
;; k = 9 : 0.6180555555555556
