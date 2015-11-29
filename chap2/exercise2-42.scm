
(define (accumulate op initial sequence)
    (define (iter result rest)
        (if (null? rest)
        result
        (iter (op result (car rest))
            (cdr rest))))
    (iter initial sequence))

(define (flatmap proc seq)
    (accumulate append '() (map proc seq)))

(define (enumerate-interval i j)
    (define (iter count total)
        (cond ((<= count j) (iter (+ count 1) (append total (list count))))
            (else 
             total)))
    (iter i '()))

(define (adjoin-position new-row k rest-of-queens)
    (cons new-row rest-of-queens)
)

(define (empty-board) '())

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
                (flatmap
                    (lambda (rest-of-queens)
                        (map (lambda (new-row)
                                     (adjoin-position new-row k rest-of-queens))
                             (enumerate-interval 1 board-size)))
                    (queen-cols (- k 1)))))
    (queen-cols board-size))

(display (queens 3))
