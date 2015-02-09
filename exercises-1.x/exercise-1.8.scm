(set! load-noisily? #t)

;Using Newton's formula for getting a better approximation of the cube root we will rewrite the program from
;the previous exercise to return the cube root of a given number

;see exercise-1.7.scm for an explanation of the original code
;for this code we will simply change the improve method to implement newton's formula for cube roots

;this expression is equivalent to (x/y^2 + 2y) / 3
;where y is the initial guess of the cube root and x is the cube
(define (improve guess x) (/ (+ (/ x (* guess guess)) (* guess 2)) 3))

(define (good-enough? guess oldguess) (< (abs (- guess oldguess)) (* guess 0.0001)))
(define (cube-iter guess oldguess x) (if (good-enough? guess oldguess) guess (cube-iter (improve guess x) guess x)))

;we will keep the same method of tracking the relative difference between guesses from exercise 1.7

;testing 
(cube-iter 0.5 5.0 64.0)

