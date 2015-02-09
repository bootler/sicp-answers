(set! load-noisily? #t)

; "The following procedure computes a mathematical function called Ackermann's function."

;(textbook code)
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
		
; "What are the values of the following expressions?"

(A 1 10) ;1024

(A 2 4)  ;65536

(A 3 3)  ;65536

;it is is easy to come up with these values by running the defined procedures
;but we can also use the substitution model to demonstrate how to get these values

(A 1 10)
(A 0 (A 1 9)
(A 0 (A 0 (A 1 8)
;....etc
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1)))))))))) 
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4)))))))) 
;.....etc
(A 0 512)
;Value: 1024

;The same applies to (A 2 4) and (A 3 3). 

; "Consider the following procedures, where A is the procedure defined above:"

(define (f n) (A 0 n)) ;2n

(define (g n) (A 1 n)) ;2^n

(define (h n) (A 2 n)) ;2^2^2....(repeat for n)

(define (k n) (* 5 n n)) ;5n^2

; "Give concise mathematical definitions for the functions computed by the procedures f, g, and h for positive integer values of n. 
;  For example, (k n) computes 5n2."
