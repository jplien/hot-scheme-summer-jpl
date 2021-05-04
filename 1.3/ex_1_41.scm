#lang sicp

(define (double f)
  (lambda (x) (f (f x))))

(define (inc x)
  (+ x 1))

(inc 1)
((double inc) 1)
(((double (double double)) inc) 5)