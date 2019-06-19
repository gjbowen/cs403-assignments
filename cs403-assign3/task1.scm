; Task 1
(define (scoping var scope)
	(define (iter vars vals status)
		(cond
			((null? vars)
				status
				)
			((eq? (car vars) var)
				status
				)
			((and (eq? (car vars) '__context) (eq? (car vals) 'nil))
				"undefined"
				)
			((eq? (car vars) '__context)
				(iter (reverse (cadr (car vals))) (reverse (caddr (car vals))) "free")
				)
			(else
				(iter (cdr vars) (cdr vals) status)
				)
			)
		)
	(iter (reverse (cadr scope)) (reverse (caddr scope)) "bound" )
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
