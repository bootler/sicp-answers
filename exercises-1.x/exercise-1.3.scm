(set! load-noisily? #t)

;Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers. 

;square a number
(define (square x) (* x x))

;square two numbers and add them together
(define (sum-of-squares x y) (+ (square x) (square y)))

;Take the largest two (of three numbers) and add their squares
(define (sum-of-largest-two-squares x y z) (if (>= x y) (sum-of-squares x (if (>= y z) y z))
														(sum-of-squares y (if (>= x z) x z)))
)

(sum-of-largest-two-squares 2 3 4)
(sum-of-largest-two-squares 4 3 2)
(sum-of-largest-two-squares 4 3 5) 