; Task 5
; RESOURCES "You will likely need to peruse the web for this task." 
;	- http://www.cs.sfu.ca/CourseCentral/383/tjd/scheme-ChurchEncodings.html
; 	- http://www.billthelizard.com/2010/10/sicp-26-church-numerals.html

; The first takes an Arabic number and produces the equivalent Church numeral.
(define (create x)
	(define (iter num)
		((lambda (a)
			(if (=  a 0)
				(lambda (b) (lambda (c) c)); base case
				((lambda (d)
					(lambda (b)
						(lambda (c) (b ((d b) c)))
						)
					) 
					(iter (- a 1))
					)
				)
			)num)
			)
	(iter x)
	)
; The second produces the predecessor of the given Church numeral.
(define (pred churchNum)
	(lambda (f)
		(lambda (a)(
				((churchNum 
					(lambda (b) (lambda (c) (c (b f))))
					) (lambda (d) a)) (lambda (d) d)
				)
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