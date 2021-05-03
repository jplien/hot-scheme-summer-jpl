#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; test, should = 1.2587315962971173
;(fixed-point (lambda (y) (+ (sin y) (cos y)))
;             1.0)

(define (golden initial-guess)
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               initial-guess))

; should = 1.61803
(golden 1.0)

