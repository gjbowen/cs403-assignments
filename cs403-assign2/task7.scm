; Task 7
(define (accumulate op initial sequence)
	(if (null? sequence)
		initial
		(op (car sequence)
			(accumulate op initial (cdr sequence))
			)
		)
	)

(define (accumulate-n op int seqs)
	(if (null? (car seqs))
		nil
		(cons (accumulate op int (map car seqs))
			(accumulate-n op int (map cdr seqs))
			)
		)
	)

(define (dot-product v w);returns the sum
	(accumulate + 0 (map * w v))
	)

(define (transpose m) ;returns the matric n
	(accumulate-n cons nil m);blanks filled in
	)

(define (matrix-*-vector m v) ;returns the vector t
	(map (lambda (row) (dot-product row v)) m) ;blanks filled in
	)

(define (matrix-*-matrix m n) ;returns the matrix p
	(let ((cols (transpose m)))
		(map 
			(lambda (row) (matrix-*-vector cols row)) 
			n)
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