
(define (memq item x)
    (cond ((null? x) 'false)
          ((eq? item (car x)) (car x))
          (else (memq item (cdr x)))))


(display (memq 'red '((red shoes) (blue socks))))
(display (memq 'red '(red shoes blue socks)))
