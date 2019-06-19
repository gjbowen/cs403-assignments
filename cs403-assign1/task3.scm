;Task3
(define (root-n nth)	;basically in the book, catered to root 5 and good-enough? is now percentage base
	(define (helper x);only use x for the call
		(define (good-enough? guess y)
	    	(<= (abs (- (*  (/  (^ guess nth) y) 100) 100 )) 10e-14)  ;returns true if guess is good or false for do again
	    	)
		(define (improve guess y)
	    	(/ (+ (* (real (- nth 1)) guess) (real (/ y (^ guess (- nth 1))))) nth) ; formula setup for specified n root
	    	)
		(define (iter guess y )
	    	(if (= y 0) ;base case
		    	0 
		    	(if (good-enough? guess y)
		    		guess
		    		(iter (improve guess y) y)
		    		)
	    		)
	    	)
		(iter 1 (real (* 1. x)))
		)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	(println "((root-n " arg1 ") " arg2 ") is " (fmt "%.15f"((root-n arg1)144)))
	)