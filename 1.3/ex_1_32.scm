#lang sicp

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (product term a next b)
  (accumulate * 1.0 term a next b))

(define (ident a) a)
(define (inc a) (+ a 1))

(define (factorial n)
  (product ident 1 inc n))

(factorial 10)

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (product-rec term (next a) next b))))

(define (product-rec term a next b)
  (accumulate-rec * 1.0 term a next b))

(define (factorial-rec n)
  (product-rec ident 1 inc n))

(factorial-rec 10)