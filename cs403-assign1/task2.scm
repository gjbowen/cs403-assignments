; Task 2
(define (mandelbrot t)
	(define (helper x y r s total)
		(if (> (+ (* r r) (* s s)) 4)
			total
			(if (> total t)
				0
				(helper x y 
					(+ (- (* r r) (* s s)) x);arg 3 (r)
					(+ (* 2 r s) y);arg 4 (s)
					(+ total 1);arg 5 (total)
					)
				)
			)
		)
	(lambda (x y) (helper x y 0.0 0.0 0))
)

(define (main)
	(setPort (open (getElement ScamArgs 1) 'read))
	(define arg1 (readExpr))
	(define arg2 (readExpr))
	(define arg3 (readExpr))
	(println "((mandelbrot " arg1 ") " arg2 " " arg3 ") is " ((mandelbrot  arg1) arg2 arg3))
	)