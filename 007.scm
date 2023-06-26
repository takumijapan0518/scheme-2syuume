#lang racket
(define (d x E)
  (cond ((constant? E) (diff-constant x E))
    ((variable? E) (diff-variable x E))
    ((sum? E) (diff-sum x E))
    ((product? E) (diff-product x E))
    (else (error "d:cannot parse" E))))

(define (error msg E) (display msg) (display "E:") (display E))
(define constant? number?)
(define (diff-constant x E) 0)

(define variable? symbol?)

(define (diff-variable x E)
  (if (equal? x E) 1 0) )

(define (sum? E)
  (and (pair? E)
    (equal? '+ (car E)) ))

(define (make-sum x) (cons '+ x))

(define (args E) (cdr E))

(define (diff-sum x E)
  (make-sum 
    (map (lambda (expr) (d x expr))
      (args E) )))

(define (product? E)
  (and (pair? E)
    (equal? '* (car E)) ))

(define (diff-product x E)
  (let* ((arg-list (args E))
        (nargs (length arg-list)) )
    (cond ((equal? 0 nargs) 0)
          ((equal? 1 nargs) (d x (car arg-list)))
          (else (diff-product-args x arg-list)) )))

(define (make-product x) (cons '* x))

(define (diff-product-args x arg-list)
  (let* ((E1 (car arg-list))
        (EP (make-product  (cdr arg-list)))
        (DE1 (d x E1))
        (DEP (d x EP))
        (term1 (make-product (list DE1 EP)))
        (term2 (make-product (list E1 DEP))) )
    (make-sum (list term1 term2)) ))
(define s (make-sum '(u v w)))
(d 'v s)

(d 'v 'v)
(d 'v 'w)
(d 'v '(+ u v w))
(d 'v '(* v (+ u v w)))
