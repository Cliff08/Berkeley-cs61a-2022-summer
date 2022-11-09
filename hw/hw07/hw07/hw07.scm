(define (cadr lst) (car (cdr lst)))

(define (make-kwlist1 keys values)
  (cons keys (cons values nil)))

(define (get-keys-kwlist1 kwlist) (car kwlist))

(define (get-values-kwlist1 kwlist)
  (cadr kwlist))

(define (make-kwlist2 keys values)
        (if (null? keys)
            nil
            (cons (cons (car keys) (cons (car values) nil)) (make-kwlist2 (cdr keys) (cdr values))))
  )

(define (get-keys-kwlist2 kwlist) 
        (if (null? kwlist)
            nil
            (cons (car (car kwlist)) (get-keys-kwlist2 (cdr kwlist)))))

(define (get-values-kwlist2 kwlist)
        (if (null? kwlist)
            nil
            (cons (cadr (car kwlist)) (get-values-kwlist2 (cdr kwlist)))))
(define (add-to-kwlist kwlist key value)
  (define key_help (get-keys-kwlist kwlist))
  (define value_help (get-values-kwlist kwlist))
  (make-kwlist (append key_help (cons key nil)) (append value_help (cons value nil)))
  )

(define (get-first-from-kwlist kwlist key)
  (define key_help (get-keys-kwlist kwlist))
  (define value_help (get-values-kwlist kwlist))
  (if (null? key_help)
        nil
  (if (eq? (car key_help) key)
      (car value_help)
      (get-first-from-kwlist (make-kwlist (cdr key_help) (cdr value_help)) key))))
