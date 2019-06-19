; Task 2
(define (replace f stuff)
	(define (helper code find replace-with)
		(cond
			((or (null? code)  (object? (car code)))
				code
				)
			((and (eq? (car code) 'quote) (eq? (car code) find))
				(set-car! code replace-with)
				)
			((eq? (car code) 'quote)
				code
				)
			((is? (car code) 'CONS) ;cdr down
				(helper (car code) find replace-with)
				(helper (cdr code) find replace-with)
				)
			((eq? (car code) find) ; FOUND!!!
				(set-car! code replace-with)
				(helper (cdr code) find replace-with)
				)
			(else
				(helper (cdr code) find replace-with)
				)
			)
		)
	(define (replacements stuff) ;go through the replacement values
		(cond
			((null? stuff)
				f
				)
			(else 
				(helper (get 'parameters f) (car  stuff) (cadr stuff))
				(helper (get 'code f) (car  stuff) (cadr stuff))
				(replacements (cddr stuff))
				)
			)
		)
	(replacements stuff)
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define env this)
	(define (replacements expr)
		(if (not (eof?))
			(begin
				(eval expr env)
				(replacements (readExpr))
				)
			)
		)
	(replacements (readExpr))
	)
