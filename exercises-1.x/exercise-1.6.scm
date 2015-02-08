; "Alyssa P. Hacker doesn't see why if needs to be provided as a special form. 
;``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. 
; "Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

;(textbook code)
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
		
; "Delighted, Alyssa uses new-if to rewrite the square-root program: "

;(textbook code)
(define (sqrt-iter guess x) 
	(new-if (good-enough? guess x) 
		guess 
		(sqrt-iter (improve guess x) x)))
					 
; "What happens when Alyssa attempts to use this to compute square roots? Explain."

;ANSWER:
;Because new-if is a procedure and not a special form, it's sub expressions are always evaluated and the predicate applied.
;Since one of the conditions of new-if is sqrt-iter and new-if is itself called by sqrt-iter, the procedure will never terminate
;This differs from if, which is a special form, where the predicate is evaluated first and only the corresponding expression is evaluated.