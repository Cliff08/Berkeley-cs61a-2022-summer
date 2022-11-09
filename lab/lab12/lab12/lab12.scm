; Owner and Vehicle Abstraction
(define (make-owner name age)
  (cons name (cons age nil)))

(define (get-name owner) (car owner))

(define (get-age owner) (car (cdr owner)))

(define (make-vehicle model year previous-owners)
  (cons model (cons year previous-owners)))

(define (get-model vehicle) (car vehicle))

(define (get-year vehicle) (car (cdr vehicle)))

(define (get-owners vehicle)  (cdr (cdr vehicle)))

(define (older-vehicle vehicle1 vehicle2)
  (define year1 (get-year vehicle1))
  (define year2 (get-year vehicle2))
  (if (> year1 year2)
      (get-model vehicle2)
      (get-model vehicle1)))

(define (new-owner vehicle owner) 
        (cons (get-model vehicle) (cons (get-year vehicle) (cons owner (get-owners vehicle)))))

(define (owners-names vehicle) 
        (map get-name (get-owners vehicle)))

(define (split-at lst n) 
        (if (= n 0)
            (cons nil lst)
            (if (null? lst)
                (cons nil nil)
                (cons (cons (car lst) (car (split-at (cdr lst) (- n 1)))) ( cdr (split-at (cdr lst) (- n 1)))))
            ))

; Tree Abstraction
; Constructs tree given label and list of branches
(define (tree label branches)
  (cons label branches))

; Returns the label of the tree
(define (label t) (car t))

; Returns the list of branches of the given tree
(define (branches t) (cdr t))

; Returns #t if t is a leaf, #f otherwise
(define (is-leaf t) (null? (branches t)))

(define (filter-odd t) 
        (if (is-leaf t)
            (if (even? (label t))
                  (tree nil nil) 
                  (tree (label t) nil))
        (if (even? (label t))
                  (tree nil (map filter-odd (branches t))) 
                  (tree (label t) (map filter-odd (branches t)))) 



          ))
