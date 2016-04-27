;How it works:
;the main method checks the following conditions.
;If the amount to change is 0, that is 1 way to make change
;if the amount is less than 0 or there are 0 kinds of coins there are no ways to make change
;otherwise add the amount of ways to make change without the first kind of coin to all the ways to change
;the original amount minus the value of the first kind of coin

;Why it works:
;given an amount greater or equal to the first kind of coin that is used to make change, and a set number of
;progressively smaller coins, you can recursively find the ways  each denomination is changed from other denominations
;and add that to a running total until you've hit your original value

;Substitution - change 10 cents with pennies and nickles
(cc 10 2)
(cc (+ (cc 10 1) (cc 5 1)))
(cc (+ (+ (cc 10 0) (cc 9 1)) (+ (cc 4 0) (cc 4 1))))
(cc (+ (+ 0 (+ (cc 9 0) (cc 8 1)) (+ 0 (+ cc (4 0) (cc 3 1))))))
;...etc
(3)

;Remember when a recursive procedure returns a fixed value, say 1, as a part of a degenerate condition
;then the procedure will end up getting the value you expect (3 in our case) by calling itself the correct number of times
;and therefore stacking the fixed value that many times (assuming the recursive operation is addition as above)



;textbook code
(define (count-change amount)
  (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1)) (cc (- amount (first-denomination kinds-of-coins))kinds-of-coins))
		)))
					 
;textbook code					 
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
		

