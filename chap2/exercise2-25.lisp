
(define list-in (list 1 3 (list 5 7) 9))
(define list-in2 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(define list-in3 (list (list 7)))

(display (cdr (car (cdr (cdr list-in)))))
(newline)
(display (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr list-in2))))))))))))
(newline)
(display (car list-in3))
