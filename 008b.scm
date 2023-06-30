#lang racket
(define (fib2 l m n)
  (cond ((equal? n 0) l)
        ((equal? n 1) m)
        (else (fib2 m (+ l m) (- n 1)))))
(define (fib n) (fib2 1 1 n))

(time (fib 40))
