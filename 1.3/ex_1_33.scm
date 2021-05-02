#lang sicp

(define (filtered-accumulate combiner null-value pred? term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (pred? a)
                           (combiner result (term a))
                           result))))
  (iter a null-value))

