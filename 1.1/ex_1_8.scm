#lang sicp
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (good-enough? guess x)
  (< (abs (- (- (cube (improve guess x)) x) (- (cube guess) x))) (* x 0.00001)))
(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
                 x)))
(define (cubert x)
  (cubert-iter 1.0 x))

(improve 1.0 8)
(cubert 8)
(cubert 2E-20)
(cubert 2E20)

