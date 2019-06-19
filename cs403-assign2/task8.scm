; Task 8
(define (node value left right) ;given
	(define (display) (print value))
	this
	)

(define (newBST value) ;given
	(node value nil nil)
	)

(define (displayBST root) ;given
	(define (iter root indent)
		(if (valid? root)
			(begin
				(iter (root'right) (string+ indent "    "))
				(print indent)
				((root'display))
				(println)
				(iter (root'left) (string+ indent "    "))
				)
			)
		)
	(iter root "")
	)

(define (insertBST tree number)
	(cond
		((null? tree) ;no tree exists. make new one
			(newBST number)
			)
		((> number (tree'value))
			(node 
				(tree'value);value
				(tree'left);left
				(insertBST (tree'right) number);right
				)
			)
		((< number (tree'value))
			(node 
				(tree'value);value
				(insertBST (tree'left) number);left
				(tree'right);right
				)   
			)
		(else 
			(begin
				(println "FATAL ERROR")
				)
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