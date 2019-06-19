;Task 6
(define (S f n)
	(define (helper i value)
		(if (<= i n)
		 	(helper 
				(+ i 1); increment
				(+ value (f i)); update value
				)
			value
			)
		)
	(helper 0 0.0)
	)

(define (w f i)
	(if (= i 0)
		(f i)
		(/
			(- ;numerator
				(* (S f (+ i 1))
					(S f (- i 1))
					)
				(^ (S f i) 2)
				)
			(+ ;denomenator
				(- (S f (+ i 1))
					(* 2 (S f i))
					)
				(S f (- i 1))
				)
			)
		)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (eval (readExpr) this))	
	(define arg2 (readExpr))
	(println "(S " arg1 " " arg2 ") is " (fmt "%.15f" (S arg1 arg2)))
	(println "(w " arg1 " " arg2 ") is " (fmt "%.15f" (w arg1 arg2)))
	)