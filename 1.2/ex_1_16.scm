#lang sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 10)
(fast-expt 3 3)

(define (fast-expt-iter a b n)
  (cond ((= n 1) (* a b))
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) b (- n 1)))))

(define (exp b n)
  (fast-expt-iter 1 b n))

(exp 2 10)
(exp 3 3)