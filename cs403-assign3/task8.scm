; Task 8
(define (sum-of-cubes pair)
	(define (cube x)
		(* x x x)
		)
	(+  (cube (car pair)) 
		(cube (cadr pair))
		)
	)

(define (ramanujan)
	(define (helper stream)
		(if (== (sum-of-cubes (stream-car stream)) 
				(sum-of-cubes (stream-car (stream-cdr stream)))
				)
			(cons-stream ;cons the stream
				(sum-of-cubes (stream-car stream))
				(helper (stream-cdr (stream-cdr stream)))
				)
			(helper (stream-cdr stream)) ; else, go again!
			)
		)
	(helper (weighted-pairs integers integers sum-of-cubes))
)

(define (sdisplay n s)
	(define (helper s count)
		(cond
			((= count 0)
				(print ",...)")
				)
			((= n count) 
				(print "(")
				(print (stream-car s))
				(helper (stream-cdr s) (- count 1))
				)
			(else
				(print ",")
				(print (stream-car s))
				(helper (stream-cdr s) (- count 1))
				)
			)
		)
	(helper s n)
	)

(define (add-streams stream t)
	(cons-stream
		(+ (stream-car stream) (stream-car t))
		(add-streams (stream-cdr stream) (stream-cdr t))
		)
	)

; Page 328
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))


(define (merge-weighted s1 s2 weight)
	(if (<= (weight (stream-car s1)) (weight (stream-car s2)))
		(cons-stream
			(stream-car s1)
			(merge-weighted (stream-cdr s1) s2 weight)
			)
		(cons-stream
			(stream-car s2)
			(merge-weighted s1 (stream-cdr s2) weight)
			)
		)
	)
(define (weighted-pairs s t weight)
	; Page 320
	(define (stream-map proc s) 
		(cons-stream 
			(proc (stream-car s)) 
			(stream-map proc (stream-cdr s))
			)
		)
	(cons-stream
		(list (stream-car s) (stream-car t))
		(merge-weighted
			(stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
			(weighted-pairs (stream-cdr s) (stream-cdr t) weight)
			weight
			)
		)
	)

; (sdisplay (Ramanujan) 50) (println)
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