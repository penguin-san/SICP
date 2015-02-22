(define (a-plus-abs-b a b) 
	((if (> b 0) + -) a b))

if b is larger than 0
	result = a + b
else b is smaller than 0
	result = a - b
