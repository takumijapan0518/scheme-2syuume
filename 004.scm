#lang racket
(define s '(* 3 5))
(define t '(+ 1 2))
(define u (map list s t)
u

(define (square x) (*x x))
(map square '(1 2 3 4 5))
(map (lambda (x) (* x x)) '(1 2 3 4 5))
