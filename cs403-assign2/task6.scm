; Task 6
(define (powerSet s)
	(if (null? s)
		'(())
		(let ((remaining (powerSet (cdr s))))
			(merge
				remaining
				(map
					(lambda (x) (cons (car s) x))
					remaining
					)
				)
			)
		)
	)
	
(define (merge a b)
	(cond
		((null? a)
			b)
		((null? b)
			a)
		((< (length (car a)) (length (car b)))
			(cons (car a) (merge (cdr a) b))
			)
		(else
			(cons (car b) (merge a (cdr b)))
			)
		)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define env this)
	(setNilDisplay 'nil)
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