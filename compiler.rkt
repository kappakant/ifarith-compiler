#lang racket

(define (bop? op) (member op '(+ * - << >>)))
(define (uop? op) (member op '(- not)))

(define (lit? l)
  (match l
    [(? integer? i) #:when (and (>= i (- (expt 2 63))) (< i (expt 2 63))) #t]
    ['true #t]
    ['false #t]
    [_ #f]))

(define (ifarith? e)
  (match e
    ;; literals
    [(? integer? i) #:when (and (>= i (- (expt 2 63))) (< i (expt 2 63))) #t]
    ['true #t]
    ['false #t]
    ;; applications of primitives, our language has no lambdas
    [`(,(? bop? bop) ,(? ifarith? e0) ,(? ifarith? e1)) #t]
    [`(,(? uop? bop) ,(? ifarith? e0)) #t]
    ;; let* works in the usual way
    [`(let* ([,(? symbol? xs) ,(? ifarith? es)] ...) ,(? ifarith? e-body)) #t]
    ;; print an arbitrary expression (must be a number at runtime)
    [`(print ,(? ifarith? e)) #t]
    ;; and/or, with short-circuiting semantics
    [`(and ,(? ifarith? e0) ,(? ifarith? es) ...) #t]
    [`(or ,(? ifarith? e0) ,(? ifarith? es) ...) #t]
    ;; if argument is 0, false, otherwise true
    [`(if ,(? ifarith? e0) ,(? ifarith? e1) ,(? ifarith? e2)) #t]
    ;; cond where the last case is else
    [`(cond [,(? ifarith? conditions) ,(? ifarith? bodies)]
            ...
            [else ,(? ifarith? else-body)]) #t]
    [_ #f]))

(define (ifarith->ifarith-tiny e)
  (match e
    ;; literals
    [(? integer? i) i]
    ['true e]
    ['false e]
    [(? symbol? x) x]
    [`(,(? bop? bop) ,e0 ,e1) `(,bop ,(ifarith->ifarith-tiny e0) ,(ifarith->ifarith-tiny e1))]
    [`(,(? uop? uop) ,e) `(,uop ,(ifarith->ifarith-tiny e))]
    ;; 0-binding case
    [`(let* () ,e) 'todo]
    ;; 1+-binding case
    [`(let* ([,(? symbol? x0) ,e0]) ,e-body)
     'todo]
    [`(let* ([,(? symbol? x0) ,e0] ,rest-binding-pairs ...) ,e-body)
     'todo]
    ;; print an arbitrary expression (must be a number at runtime)
    [`(print ,_) e]
    ;; and/or, with short-circuiting semantics
    [`(and ,e0) (ifarith->ifarith-tiny e0)]
    [`(and ,e0 ,es ...) (ifarith->ifarith-tiny `(if ,e0 (and ,@es) 0))]
    [`(or ,e0) (ifarith->ifarith-tiny e0)]
    [`(or ,e0 ,es ...) (ifarith->ifarith-tiny `(if ,e0 true (or ,es)))]
    ;; if argument is 0, false, otherwise true
    [`(if ,e0 ,e1 ,e2) `(if ,(ifarith->ifarith-tiny e0)
                            ,(ifarith->ifarith-tiny e1)
                            ,(ifarith->ifarith-tiny e2))]
    ;; cond where the last case is else
    [`(cond [else ,(? ifarith? else-body)])
     (ifarith->ifarith-tiny else-body)]
    [`(cond [,c0 ,e0] ,rest ...)
     (ifarith->ifarith-tiny `(if ,c0 ,e0 (cond ,@rest)))]))
     