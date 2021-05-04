#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 2)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (let ((dx 0.1))
    (lambda (x) (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3))))

(define (square x) (* x x))

(((repeated smooth 3) square) 1.0)