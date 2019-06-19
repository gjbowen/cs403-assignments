;Task 8i
(define (ecfi n)
	(define (helper lvl value)
		(if (> lvl 0)
			(helper (- lvl 1) 
					(/ 1 ;first numerator
						(+ 1 (/ 1 ; first denominator
							(+ (* 2 lvl)
								(/ 1
								 	(+ 1 value)
									)
								)
								)
							)
						)
						
				)
			value
			)
		)
	(+ 2.0 (helper n 0.0))
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(println "(ecfi " arg1 ") is "  (fmt "%.25f"(ecfi arg1)))
	)