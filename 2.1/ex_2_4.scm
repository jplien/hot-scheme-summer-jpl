#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(let ((z (cons 1 2)))
  (newline)
  (display (car z))
  (newline)
  (display (cdr z))
  (newline))

(define z (cons 2 3))

(car z)
(cdr z)