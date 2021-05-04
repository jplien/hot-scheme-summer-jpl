#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 2)
      f
      (compose f (repeated f (- n 1)))))

(define (square x) (* x x))

((repeated square 2) 5)