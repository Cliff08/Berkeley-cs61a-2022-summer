(define (tail-replicate x n)
  ; BEGIN
  (define (tail-replicate-help x n m)
    (if (= 0 n)
      m      
      (tail-replicate-help x (- n 1) (cons x m))))
  (tail-replicate-help x n nil)
  ; END
)