(define (new-list . args)
  (let ([count (car args)])
    (if (<= count 0)
        (list)
        (if
         (= 1 (length args)) (new-list count (lambda (x) x))
         (let ([p (car (cdr args))])
           (if (procedure? p)
               (append (new-list (- count 1) p) (list (p (- count 1))))
               (new-list (car args) (lambda (x) p))
               ))))))

(new-list -1)
(new-list 10)
(new-list 10 #f)
(new-list 10 '())
(new-list 10 (lambda (x) (* x x)))
(new-list 10 -)  