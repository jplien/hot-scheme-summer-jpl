#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; test, should = 1.2587315962971173
;(fixed-point (lambda (y) (+ (sin y) (cos y)))
;             1.0)

(define (expexp initial-guess)
  (fixed-point (lambda (x) (/ (log 1000.0) (log x)))
               initial-guess))

; Converges in 34 steps w/o average damping
(expexp 2.0)

(define (average x y) (/ (+ x y) 2))
(define (expexp-ad initial-guess)
  (fixed-point (lambda (x) (average x (/ (log 1000.0) (log x))))
               initial-guess))

; Converges in 9 steps with average damping
(expexp-ad 2.0)