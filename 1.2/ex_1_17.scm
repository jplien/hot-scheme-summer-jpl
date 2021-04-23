#lang sicp

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-mult b n)
  (cond ((= n 1) b)
        ((even? n) (fast-mult (double b) (halve n)))
        (else (+ b (fast-mult b (- n 1))))))

(fast-mult 2 10)
(fast-mult 5 5)
(fast-mult 3 3)