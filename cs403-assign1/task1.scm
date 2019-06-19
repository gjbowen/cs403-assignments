; Task 1
(define (cym val)
	(string+ "#" (hex (cyan val)) (hex (yellow val)) (hex (magenta val)))
	)

(define (yellow val)
	(int (* 255
		(+ 1  (* -1 
			(sin (* 3.14159265358979323846 .01 val))) ;use instead of /100
			)
			)
		)
	)
;quarter cycle of a left-shifted sine wave.
(define (cyan x)
	(int
		(* 255 (+ 0
				(cos (* 
					(* (real x) 3.14159265358979323846) 	
					.005)
					)
					)
			)
		)
	)
;three-quarters of a cycle of an left- and up-shifted sine wave
(define (magenta x)
	(int
		(* (* 255 
				(+ 1 (cos (* (* 3 3.14159265358979323846 (real x)) .005)))
				) 
			.5)
		)				
	)

(define (hex color)
	(string+ (getElement "0123456789ABCDEF" (int (/ color 16)))
	(getElement "0123456789ABCDEF" (int (% color 16))))
	)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(println "(cyan " arg1 ") is "  (cyan  arg1))
	(println "(yellow " arg1 ") is "  (yellow  arg1))
	(println "(magenta " arg1 ") is "  (magenta  arg1))
	(println "(cym " arg1 ") is "  (cym  arg1))
	)