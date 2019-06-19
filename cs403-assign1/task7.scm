;Task 7
(define (double n) (+ n n))

(define (halve n)
	(define (iter x y z total)
		(cond 
			((= x y)
				(+ z total))
			((<= (double x) y)
				(iter (double x) y x total))
			(else (iter 1 (- y  x) 0 (+ total z))
				)
			)
		)
	(iter 1 n 0 0) 
	)


(define (div2? n)
	(cond 
		((= n 0 ) #t)
		((= (- n (halve n)) (halve n) ) #t)
		(else 
			#f
			)
		)
	)

(define (ethiop b c)
	(define (helper b c total)
		(if (>= c 1) 
				(if (div2? c)
					(helper (double b) (halve c) total)
					(helper (double b) (halve c) (+ total b))
					)
			total
			)
		)
	(helper b c 0)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	(println "(halve " arg1 ") is " (halve  arg1))
	(println "(double " arg1 ") is " (double arg1))
	(println "(div2? " arg1 ") is " (div2? arg1))
	(println "(ethiop " arg1 " " arg2 ") is " (ethiop arg1 arg2))
	)