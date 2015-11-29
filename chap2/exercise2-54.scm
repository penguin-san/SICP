(define (memq item x)
    (cond ((null? x) 'false)
          ((eq? item (car x)) (car x))
          (else (memq item (cdr x)))))

(define (equal? x y)
    (cond ((null? x) 't)
          ((eq? (car x) (car y)) (equal? (cdr x) (cdr y)))
          (else 'f) 
    )
)

(display (equal? '(this is a list) '(this (is a) list)))
