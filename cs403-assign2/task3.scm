;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Task 3
; Stack
(define (Stack)
	'()
	)
(define (push stack value)
	(cons value (car (list stack)))
	)
(define (pop stack)
	(cdr stack)
	)
(define (speek stack)
	(car stack)
	)
(define (ssize stack)
	(length stack)
	)

; Queue
;The idea is to maintain 
;  two stacks, an input stack 
;  and an output stack. 
;When you dequeue, you pop from the output stack.
;  If the output stack is empty, however, you 
;  transfer over the input stack to the output 
;  stack and then pop.
(define (Queue) 
	(makeQueue (Stack) (Stack))
	)

(define (makeQueue input output) 
	this
	)

(define (enqueue q val)
	(makeQueue 
		(push (q 'input) val) ;input
		(q 'output) ;output
		)
	)

(define (dequeue q)
	(if (= (ssize (q 'output)) 0)
		(dequeue (makeOutputStack (q 'input) (q 'output)));output is empty, 'transfer' output input to output		
		(makeQueue (q 'input) (pop (q 'output))) ;pop from output stack
		)
	)

(define (qpeek q)
	(if (= (ssize (q 'output)) 0)
		(qpeek (makeOutputStack (q 'input) (q 'output)))
		(speek (q 'output))
		)
	)
	
(define (qsize q)
	(+ (ssize (q 'input)) (ssize (q 'output)))
	)
;;;;HELPER
(define (makeOutputStack in out)
	(if (> (ssize in) 0)
		(makeOutputStack (pop in) (push out (speek in)))
		(makeQueue in out)
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