; Task6
(define (sdisplay count s)
	(define (helper s location)
		(cond
			((>= location count)
				nil
				)
			(else
				(print (stream-car s) ",")
				(helper (stream-cdr s) (+ location 1))
				)
			)
		)
	(print "(")
	(helper s 0)
	(print "...)")
	)

(define (quad a b c step)
	(define (steps x)
		(cons-stream (+ (stream-car x) (real step)) (steps (stream-cdr x)))
		)

	(define xs (cons-stream 0.0 (steps xs)));gives the distance between evaluations of the quadratic, starting at zero
	(define (fs xs)
		     (cons-stream (+ (* a (* (stream-car xs) (stream-car xs))) (* b (stream-car xs)) c) (fs (stream-cdr xs)))
		)
	(cons-stream (+ (* a (* (stream-car xs) (stream-car xs))) (* b (stream-car xs)) c) (fs (stream-cdr xs)))
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (integrate s h)
	(define (helper s self)
		(cons-stream 
			(+ (stream-car self) (* (/ (+ (stream-car s) (stream-car (stream-cdr s))) 2) h)) 
			(helper (stream-cdr s) (stream-cdr self))
			)
		)
	(define integrate-stream (cons-stream (real 0) (helper s integrate-stream)))
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (derivate s step const)
	(define (deriv s step b1)
		(cons-stream 
			(- (* (/ (- (stream-car (stream-cdr s)) (stream-car s)) step) 2.0) b1) 
			(deriv (stream-cdr s) step (- (* (/ (- (stream-car (stream-cdr s)) (stream-car s)) step) 2) b1)))
		)
	(cons-stream (real const) (deriv s step const))
	)
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (same-stream? s1 s2 count thresh)
	(cond
		((= count 0)
			#t
			)
		((< (abs (- (stream-car s1) (stream-car s2))) thresh)
			(same-stream? (stream-cdr s1) (stream-cdr s2) (- count 1) thresh)
			)
		(else
			#f
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
