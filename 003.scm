#lang racket
(define x 0)
(define y 1)
(let ((x 2)(y x)) y)
(let* ((x 2)(y x)) y)
