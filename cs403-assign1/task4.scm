;Task 4
(define (crazyTriangle left right)
	; driver of the program
  	(define (helper remLvls)
	  	(define (getNumber curLevel col)
			(cond
				((= col 0) left)
				((= curLevel col) right)
				(else
					(+ 
						(getNumber (- curLevel 1) (- col 1))
						(getNumber (- curLevel 1) col)
						)
					)
				)
	    	)
	  	;print current line
		(define (printLine curLevel)
			(if (<= curLevel (- remLvls 1)); if we still have levels to print..
				(begin 
					(indent (- remLvls curLevel 1)); add the beginning indentation
					;another function to print the current col
					(define (printCol col)
						(if (<= col curLevel)
							(begin 
								(if (= col curLevel) ; get next number. ONLY add space if its not the end
									(print  (getNumber curLevel col))
									(print  (getNumber curLevel col) " " )
									)
								(printCol (+ col 1))
								)
							)
						)
					(printCol 0);start on the first column
					(println) ;new line
					(printLine (+ curLevel 1));start next line
					)
				)
			)
		;add the space from first integer
		(define (indent spaces)
			(if (> spaces 0); keep going
				(begin
					(indent (- spaces 1))
					(print " ")
					)
				)
			)
		(printLine 0)
		)
	)
(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	(define arg3 (readExpr))
	(println "((crazyTriangle " arg1 " " arg2 ") " arg3 ")")
	((crazyTriangle arg1 arg2) arg3)
	)