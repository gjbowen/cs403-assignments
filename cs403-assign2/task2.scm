; Task 2
(define (curry @)
    (define (function? x) (if (is? x 'CONS) #t  #f))
    (define (enoughParams? l) (if (< (length (cdr l)) (length (get 'parameters (car l)))) #t #f))
    (define (applyStuff f @) (lambda (@) (curry (append f @))))

    (if (not (null? @))
        (if (function? (car @)) 
            (if (enoughParams? (car @)) ; its a function. 
                (applyStuff (car @) @) ; enough params 
                (apply (car (car @)) (cdr (car @)))    
                )
            ((lambda (x) (
                (lambda (@) (curry (append x @)))
                )) @)
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
