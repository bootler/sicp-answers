(set! load-noisily? #t)

; "A function f is defined by the rule that f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. 
; Write a procedure that computes f by means of a recursive process. 
; Write a procedure that computes f by means of an iterative process."



;Recursive because it builds up a set of deferred operations
(define (f n) (if (< n 3) n (+ (* (f (- n 1))) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

;testing
(f 4)
(f 5)

;(small illustration, helped me with the iterative part)
;(f(3)) + (2(f(2))) + (3(f(1)))
;((f(2)) + (2(f(1))) + (3(f(0)))) + 4 + 3
;(2 + 2 + 0) + 4 + 3
;11



;Iterative because the amount of operations doesn't grow, instead a fixed amount of variables
;are updated until an end condition is satisfied.
(define (f n)
	(define (f-iter a b c n)
		(if (< n 3) a (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1)))
	)
	(if (< n 3) n (f-iter 2 1 0 n)) ;(we start with 2 1 0 because they are the solutions to f(2) f(1) and f(0) respectively)
)

;testing
(f 6)
(f 7)