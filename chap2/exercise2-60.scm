
(define (element-of-set? x set) 
    (cond ((null? set) #f)
          ((equal? x (car set)) #t)
          (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)))

(define (union-set a b)
    (cond ((null? b) a)
          ((union-set (adjoin-set (car b) a) (cdr b)))))

(display (union-set '(2 1 3) '(3 4 5)))
