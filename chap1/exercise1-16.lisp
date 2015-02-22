; 模範解答



(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
  		((even? n) (fast-expt-iter (square b) (/ n 2) a))
		(else 
			(fast-expt-iter b (- n 1) (* a b)))))

(define (even? n) (= (% n 2) 0))
(define (square n) (* n n))

(display (fast-expt 2 4))

