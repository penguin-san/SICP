
(define (square n) (* n n))
(define (square-tree tree)
	(tree-map square tree))

(define (tree-map func tree)
	(cond ((number? tree) (func tree))
		  ((pair? tree) (cons (tree-map func (car tree)) (tree-map func (cdr tree))))
		  (else '())
	)
)

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(newline)
(display (square-tree x))
