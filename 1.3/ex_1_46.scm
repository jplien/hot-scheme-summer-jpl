#lang sicp

(define (iterative-improve close-enough? improve)
  (define (try guess)
    (if (close-enough? guess)
        guess
        (try (improve guess))))
  try)

;******** Sqrt 1.1.7
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) guess))

(sqrt-iter 1.0 4.0)

;******** Sqrt via fixed point

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? g)
    (< (abs (- g (f g)))
       tolerance))
  ((iterative-improve close-enough? f) first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square-root x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(square-root 4)