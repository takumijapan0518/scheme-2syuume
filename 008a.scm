#lang racket
(define (fib n)
  (cond ((equal? n 0) 1)
        ((equal? n 1) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))
(time (fib 40))
