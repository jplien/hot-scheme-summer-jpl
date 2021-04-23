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

(define (fast-mult-iter a b n)
  (cond ((= n 1) (+ a b))
        ((even? n) (fast-mult-iter a (double b) (halve n)))
        (else (fast-mult-iter (+ a b) b (- n 1)))))

(define (mult b n)
  (fast-mult-iter 0 b n))

(mult 2 10)
(mult 5 5)
(mult 3 3)