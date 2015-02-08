(set! load-noisily? #t)

; "The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. 
; Also, in real computers, arithmetic operations are almost always performed with limited precision. 
; This makes our test inadequate for very large numbers. 
; Explain these statements, with examples showing how the test fails for small and large numbers. 
; An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. 
; Design a square-root procedure that uses this kind of end test. 
; Does this work better for small and large numbers?"

; setting up the original method
(define (average x y) (/ (+ x y) 2))
(define (improve guess x) (average guess (/ x guess)))
(define (good-enough? guess x) (< (abs (- (* guess guess) x)) 0.0001))

(define (sqrt-iter guess x) (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))

;now let's run it with a very small number
(sqrt-iter 0.0005 0.00009876)

;Value: 0.0005
;The problem with small numbers is that the tolerance of 0.0001 is way too high to get a precise value.

;let us attempt it instead with a large number
(sqrt-iter 8000.0 1000000000000.0)

;Value: 1000000.
;The problem with large numbers is that machines are not able to recognize small differences between very large numbers
;Therefore the difference will eventually evaluate to 0 and a result will be returned that is not within the desired 0.0001 percent

;Now let us implement the alternative strategy and see how it works

;First we'll define a new method that tracks the relative change of the guess
(define (new-good-enough? guess oldguess) (< (abs (- guess oldguess)) (* guess 0.0001)))

;Next we define a new square root method which implements the change
(define (new-sqrt-iter guess oldguess x) (if (new-good-enough? guess oldguess) guess (sqrt-iter (improve guess x) x)))

;Because the new tolerance is relative to the guess and not the square, it doesn't face the same precision problems
;when evaluating very large and very small squares
