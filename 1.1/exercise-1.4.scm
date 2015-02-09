(set! load-noisily? #t)

; "Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
;  Use this observation to describe the behavior of the following procedure: "

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
  
; if b > 0 (+ a b), else (- a b). The absolute value of b will always be added because a - (-b) = a + b
