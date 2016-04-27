;Exercise 1.12
;Write a procedure that computes elements of Pascal's triangle by means of a recursive process. 

(define (pascal row col)
		(if (> col row) "out of bounds")
		(cond (	(= row 1) 1)
			  ( (= col 1) 1)
			  
			  
			  
	