; Task 10r
(define (ramanujanr depth)
	(define (helper lvl)
		(if (<= lvl depth)
			(sqrt (+ (+ 6 lvl) (* (+ lvl 2) (helper (+ lvl 1)))))
			0
			)
		)
	(helper 0)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(println "(ramanujanr " arg1 ") is " (fmt "%.25f" (ramanujanr arg1)))
	(println "$4$")
	)