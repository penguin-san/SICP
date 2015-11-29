
(define (element-of-set? x set)
    (cond ((null? set) #f)
          ((= x (car set)) #t)
          ((< x (car set)) #f)
          (else (element-of-set? x (cdr set)))
    )
)



(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)
    )
)

(display (adjoin-set 5 '(1 3 5)))

