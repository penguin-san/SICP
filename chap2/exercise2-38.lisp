
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

(display (fold-right / 1 (list 1 2 3)))
(newline)
(display (fold-left / 1 (list 1 2 3)))
(newline)
(display (fold-right list '() (list 1 2 3)))
(newline)
(display (fold-left list '() (list 1 2 3)))
