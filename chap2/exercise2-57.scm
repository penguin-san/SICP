
(define (=number? exp num) (and (number? exp) (= exp num)))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
    (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (make-sum a1 a2)
     (cond ((=number? a1 0) a2)
           ((=number? a2 0) a1)
           ((and (number? a1) (number? a2))
            (+ a1 a2))
           (else (list '+ a1 a2))))
(define (make-product m1 m2) 
     (cond ((or (=number? m1 0) (=number? m2 0)) 0)
           ((=number? m1 1) m2)
           ((=number? m2 1) m1)
           (else (list '+ m1 m2))))
(define (make-exponentiation m1 m2) 
        (cond ((= (+ m2 1) 0) 1)
              ((= (+ m2 1) 1) m1)
              (else (list '** m1 m2))
        ))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))

(define (augend s) 
  (let ((item (cddr s)))
      (cond ((not (null? (cdr item))) (make-sum (car item) (cdr item)))
          (else (car item)))))



(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (multiplier p) (cadr p))
(define (multiplicand p)
  (let ((item (cddr p)))
      (cond ((not (null? (cdr item))) (make-product (car item) (cdr item)))
            (else (car item)))))


(define (deriv exp var)
    (cond ((number? exp) 0)
          ((variable? exp) (if (same-variable? exp var) 1 0))
          ((sum? exp) (make-sum (deriv (addend exp) var)
                                (deriv (augend exp) var)))
          ((product? exp)
           (make-sum
                (make-product (multiplier exp)
                              (deriv (multiplicand exp) var)) 
                (make-product (deriv (multiplier exp) var) (multiplicand exp))))
          ((exponentiation? exp)
                (make-product (augend exp) (make-exponentiation (addend exp) (- (augend exp) 1))))
          (else 
            (error "unknown expression type: DERIV" exp))))

(display (deriv '(* (* x y) (+ x 3)) 'x))



