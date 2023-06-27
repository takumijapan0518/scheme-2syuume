#lang racket
(define (euclid x y)
  (if (zero? x)y
    (euclid (modulo y x)x)))
(euclid 2147227 2830757)
(euclid 255063903 361736024)

(define (pow m n)
  (if (= n 0)1
      (* m (pow m (- n 1)))))
(euclid (+ (pow 3 63) 1) (- (pow 2 63) 1))
