
(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (make-pair-sum pair)
    (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))


(define (enumerate-interval i j)
  (define (iter count total)
    (cond ((<= count j) (iter (+ count 1) (append total (list count))))
      (else 
       total)))
  (iter i '()))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))
(define (prime? n) (= n (smallest-divisor n)))
(define (square x) (* x x))

(define (accumulate op initial sequence)
  (define (iter result rest)
    (if (null? rest)
    result
    (iter (op result (car rest))
          (cdr rest))))
  (iter initial sequence))

(define (uniqu-pairs n)
    (flatmap
        (lambda(i)
            (map (lambda(j) (list i j))
                 (enumerate-interval 1 (- i 1))))
        (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
    (map make-pair-sum
        (filter prime-sum?
            (uniqu-pairs n))))

(display ((lambda(i)
            (map (lambda(j) (list i j))
                 (enumerate-interval 1 (- i 1)))) 3))

