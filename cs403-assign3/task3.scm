; Task 3
(define (Node val p c)
	(define value val)
	(define parent p)
	(define child c)
	(define (set-parent p) (set 'parent p))
	(define (set-child item) (set 'child item))
	(define (set-value item)(set 'value item))
	this
	)

(define (deque)
	(define tail nil)
	(define q nil)
	(define size 0)

	(define (newNode item)
		(Node item nil nil)
		)
	(define (enqueueFront item)
		(define n (newNode item))
		(cond 
			((null? q)
				(set 'size 1)
				(set 'q n)
				(set 'tail n)
				)
			(else
				((n'set-child) q) ; original...
				((q'set-parent) n)
				(set 'q n)
				(set! size (+ size 1))
				)
			)
		)
	(define (enqueueBack item)
		(define n (newNode item))
		(cond 
			((null? q)
				(set 'size 1)
				(set 'q n)
				(set 'tail n)
				)
			(else
				((n'set-parent) tail)
				((tail'set-child) n)
				(set 'tail n)
				(set! size (+ size 1))
				)
			)
		)
	(define (enqueueIndex index item)
		(define (helper child count index item)
			(cond 
				((= count index)
					(define gc (child'child))
					(define n (Node item child gc))
					((child'set-child) n)
					(if (= index size)
						(set 'tail n)
						((gc'set-parent) n)
						)
					)
				(else
					(helper (child'child) (+ count 1) index item)
					)
				)
			)

		(cond ; if it's empty, put it up front
		 	((= index 0)
				(enqueueFront item)
				)
			(else
				(helper q 1 index item)
				(set! size (+ size 1))
				)
			)
		item
		)
	(define (dequeueFront) 
		(set! size (- size 1))
		(define val (q'value))
		(set 'q (q'child))
		(if (= size 0) ;means there's only 1 item
			(set 'tail nil)
			((q'set-parent) nil)
			)
		val
		)
	(define (dequeueBack)
		(set! size (- size 1))
		(define val (tail'value))
		(set 'tail (tail'parent))
		(if (= size 0) ;means there's only 1 item
			(set 'q nil)
			((tail'set-child) nil)
			)
		val
		)
	(define (dequeueIndex index)
		(define (helper node index count)
			(if (= index count)
				(begin
					( ((node'child)'set-parent) (node'parent))
					(if (!= count 0)
						(((node'parent)'set-child) (node'child))
						(set 'q (node'child))
						)
					(node'value)
					)
				(helper (node'parent) index (- count 1))
				)
			)
		(cond 
			((= index (- size 1)) ; too small. pop the back
				(dequeueBack)
				)
			(else
				(helper (tail'parent) index (- size 2))
				(set! size (- size 1))
				)
			)
		)
	(define (peekFront)
		(return q'value)
		)
	(define (peekBack)
		(return tail'value)
		)
	(define (display)
		(define (helper q)
			(cond 
				((and (not (null? q)) (not (null? (q'child))))
					(print (q'value))
					(print ",")
					(helper (q'child))
					)
				((not (null? q))
					(print (q'value))			
					)
				(else
					nil
					)
				)
			)
		(print "[")
		(helper q)
		(print "]")
		)
	this
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