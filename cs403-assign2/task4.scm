; Task 4
(define (let*->lambdas f)
	(define (let-iter vars body shit)
		(if (= (length vars) 1) 
				(cons
					(append 
						(append 
							(append 
								shit 
								(list 'lambda)
								)
							(list (list (car (car vars)))) ;start applying the params
							)
						body
						)
					(cdr (car vars))
					)
				(cons
					(append 
						(append 
							(append 
								shit 
								(list 'lambda)
								)
							(list (list (car (car vars))))
							)
						(list (let-iter (cdr vars) body shit))
						)
					(cdr (car vars))
					)
				)
		)
	(define (iter remaining stuff)
		(cond ((or (null? remaining) (= (length remaining) 0))
					(return stuff)
					)
				((eq? (car remaining ) 'define)
					(iter (cdr remaining) (append stuff (list (car remaining))))
					)
				((eq? (car (car remaining)) 'let* )
					(iter (cdr remaining) (append stuff (list (let-iter (cadr (car remaining)) (cddr (car remaining)) '()))))
					)
				(else
					(iter (cdr remaining) (append stuff (list (car remaining))))
					)
			)
		)	
	(iter f '())
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
