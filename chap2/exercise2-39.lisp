
(define (fold-right op initial sequence)
    (define (iter rest)
        (if (null? rest)
            initial
            (op (car rest) (iter (cdr rest)))))
            
    (iter sequence))

(define (fold-left op initial sequence)
    (define (iter result rest)
        (if (null? rest)
            result
            (iter (op result (car rest)) (cdr rest))))
    (iter initial sequence))

(define (reverse sequence) 
    (fold-left (lambda (x y) (cons y x)) '() sequence))

(define (reverse2 sequence) 
    (fold-right (lambda (x y) (append y (list x))) '() sequence))

(display (reverse2 (list 1 2 3 4)))
