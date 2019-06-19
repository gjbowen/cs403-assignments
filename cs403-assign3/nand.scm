;a Boolean operator which gives the value zero 
; if (all operands==one) return 0
; else return 1 
;and otherwise has a value of one (equivalent to NOT AND).
(define (nand-gate a1 a2 output)
	(define (logical-nand a b) 
		(if (= (+ a b) 2) 
			0 
			1
			)
		)
	(define (nand-action-procedure)
		(let ((new-value
			(logical-nand (get-signal a1) (get-signal a2))))
			(after-delay 
				6
				(lambda ()
					; (print "\nNAND active!")
					(set-signal! output new-value)
					)
				)
			)
		)
	(add-action! a1 nand-action-procedure)
	(add-action! a2 nand-action-procedure)
	'ok
	)
