#lang sicp

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1.0))

(define (ident a) a)
(define (inc a) (+ a 1))

(define (factorial n)
  (product ident 1 inc n))

(factorial 10)

(define (product-rec term a next b)
  (if (> a b)
      1.0
      (* (term a)
         (product-rec term (next a) next b))))

(define (factorial-rec n)
  (product-rec ident 1 inc n))

(factorial-rec 10)