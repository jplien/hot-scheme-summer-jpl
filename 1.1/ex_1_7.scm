#lang sicp
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (square x) (* x x))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)
(sqrt 2E-20)   ; always returns 0.03125 (sqrt 0.001)
;(sqrt 2E20)    ; never terminates

(define (new-good-enough? guess x)
  (< (abs (- (- (square (improve guess x)) x) (- (square guess) x))) (* x 0.001))
(define (new-sqrt-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (new-sqrt-iter (improve guess x)
                 x)))
(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))
(new-sqrt 9)
(new-sqrt 2E-20)   ; always returns 0.03125 (sqrt 0.001)
(new-sqrt 2E20)    ; never terminates