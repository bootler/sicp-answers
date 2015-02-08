; "Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation 
; or normal-order evaluation. He defines the following two procedures: "

;(textbook code)
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;"Then he evaluates the following expression"

(test 0 (p)) ;will not complete

; "What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? 
;  Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: 
;  The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)"

; ANSWER: 
; Ben will observe that an interpreter that uses applicative order evaluation will never complete the above procedure because (p)
; must be infinitely expanded into itself. However an interpreter using normal-order evaluation will evaluate the procedure
; and return a value of 0. 

; Because normal-order evaluation does not evaluate the operands until their values are needed, instead substituting
; operand expressions for parameters until there only primitive operaters, we can demonstrate how an interpreter using this process
; would evaluate this procedure by writing out the next step in the process and observing that the result evaluates to 0

(if (= 0 0) 0 (p))
