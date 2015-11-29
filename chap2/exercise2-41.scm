
(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (enumerate-interval i j)
  (define (iter count total)
    (cond ((<= count j) (iter (+ count 1) (append total (list count))))
      (else 
       total)))
  (iter i '()))

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

(define (make-3-pairs pairs)
    (flatmap 
        (lambda(k)
            (map (lambda(h) (list (car k) (cadr k) h))
                 (enumerate-interval 1 (- (cadr k) 1))))
        pairs)
    )
(define (target-sum n s)
    (define (check-10? pairs) 
        (= s (+ (car pairs) (cadr pairs) (caddr pairs))))

    (filter check-10? (make-3-pairs (uniqu-pairs n)))
)

(display (target-sum 6 10))
