; Task 1
(define (range start stop inc)
	(define (iter location)
		(if (< location stop)
			(cons location (iter (+ inc location)))
			nil
			)
		)
	(iter start)
	)

(define (for-loop range f)
	(if (null? range)
		nil
		(begin
			(f (car range))
			(for-loop (cdr range) f)
			)
		)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))

	(define env this)
	(define (iter expr)
		(if (not (eof?))
			(begin
				(eval expr env)
				(iter (readExpr))
				)
			)
		)
	(iter (readExpr))
	)
