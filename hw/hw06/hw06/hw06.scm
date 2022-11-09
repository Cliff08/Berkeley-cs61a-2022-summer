(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

(define (interleave lst1 lst2)
(define (interleave_help lst1 lst2 n)
        (if (or (null? lst1) (null? lst2))
            (if (null? lst1)
                lst2 lst1)
                (if (= (remainder n 2) 1)
                    (cons (car lst1) (interleave_help (cdr lst1) lst2 (+ n 1)))
                    (cons (car lst2) (interleave_help lst1 (cdr lst2) (+ n 1)))))    ) 
        (interleave_help lst1 lst2 1)
        
        )

(define (my-filter pred lst) 
        (if (null? lst)
            nil
            (if (pred (car lst))
                (cons (car lst) (my-filter pred (cdr lst)))
                (my-filter pred (cdr lst)))))

(define (concatenate s) 
        (define (concatenate_help s m)
            (if (null? s)
                m
                (if (null? (car s))
                    (concatenate_help (cdr s) m)
                        (concatenate_help (cons (cdr (car s)) (cdr s)) (cons (car (car s)) m)))))
                
        (define (reverse s n)
            (if (null? s)
                n
                (reverse (cdr s) (cons (car s) n))))
        (define s_help (concatenate_help s nil))
    (reverse s_help nil)
        ) 

        
