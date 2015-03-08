
(define (inc x l) (+ l 1))
(define (square x) (* x x))
(define (accumulate op init sequence)
	(if (null? sequence)
		init
		(op (car sequence)
			(accumulate op init (cdr sequence)))))

(define (append seq1 seq2)
	(accumulate cons seq2 seq1))

(define (length sequence)
	(accumulate inc 0 sequence))

(define (map p sequence)
	(accumulate (lambda(x y) (cons (p x) y)) '() sequence))

(define x (list 1 2 3 4 5))
(define y (list 4 5 6))

(display (map square x))
