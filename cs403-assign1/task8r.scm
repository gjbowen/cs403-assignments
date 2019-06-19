;Task 8r
(define (ecfr n)
	(define (helper lvl)
		(if (<= lvl n)
			(/ 1 ;first numerator
				(+ 1 (/ 1 ; first denominator
						(+ (* 2 lvl)
							(/ 1
								(+ 1 (helper (+ lvl 1))
									)
								)
							)
						)
					)
				)
			0
			)
		)
	(+ 2.0 (helper 1.0));handles 0
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(println "(ecfr " arg1 ") is "  (fmt "%.25f"(ecfr arg1)))
	)