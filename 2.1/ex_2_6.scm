#lang sicp

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one 
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((b f)((a f) x)))))

(define (church-to-int cn) 
  ((cn (lambda (n) (+ n 1))) 0))

(church-to-int zero)
(church-to-int one)
(church-to-int two)
(church-to-int (add two two))

((one (lambda (x) (+ 1 x))) 0)
((two (lambda (x) (+ 1 x))) 0)
(((add one two) (lambda (x) (+ 1 x))) 0)