(define (over-or-under num1 num2) 
(if(> num1 num2)
    1
    (if(= num1 num2)
        0 -1)))

(define (composed f g) 
    (lambda (x) (f (g x))))

(define (square n) (* n n))

(define (pow base exp) 
    (if(= exp 0)
        1
        (if(= (modulo exp 2) 0)
            (square (pow base (/ exp 2)))
                (* base (square (pow base (/ (- exp 1) 2)))))))

(define (ascending? lst) 
    (if (< (length lst) 2)
        #t
            (if (> (car lst) (car ( cdr lst)))
                #f
                    (ascending? (cdr lst)))))
