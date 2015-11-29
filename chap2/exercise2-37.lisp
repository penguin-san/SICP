
(define (accumulate op init sequence)
	(if (null? sequence)
		init
		(op (car sequence)
			(accumulate op init (cdr sequence)))))

(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		'()
		(cons (accumulate op init (map car seqs))
			  (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w) 
    (accumulate + 0 (map * v w)) 
)

(define (matrix-*-vector m v)
    (map (lambda(x) (dot-product v x))  m))
(define (transpose mat)
    (accumulate-n cons '() mat))
(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda(x) (matrix-*-vector cols x)) m)))

(define v (list 1 2 3))
(define w (list 1 2 3))
(define m (list 
				(list 1 2 3)
				(list 4 5 6)
				(list 7 8 9)))
(define n (list 
				(list 1 2 3)
				(list 4 5 6)
				(list 7 8 9)))


(display (matrix-*-matrix m n))
