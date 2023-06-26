#lang racket
(define nil '())
(define (remove-if f x)
  (cond ((null? x) nil)
        ((f (car x))(remove-if f (cdr x)))
        (else (cons (car x)(remove-if f (cdr x))))))

(define (myquicksort x)
  (if (null? x) nil
      (append (myquicksort(remove-if (lambda (a) (>=a (car x))) (cdr x))) (list(car x))
              (myquicksort(remove-if (lambda (b) (< b (car x))) (cdr x))))))

(myquicksort '(1 0 3 1 6 2 2))
(myquicksort '(3 1 4 1 5 9 2 6 5 3 5))
