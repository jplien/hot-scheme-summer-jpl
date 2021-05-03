#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter n d k acc)
  (if (= k 0)
      acc
      (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) acc)))))
  (cont-frac-iter n d (- k 1) (/ (n k) (d k))))

;requires 11 iterations to converge to 0.6180 (= 1 / phi)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

(define (cont-frac-rec n d k)
  (define (cont-frac-helper n d k count)
    (if (>= k count)
        (/ (n count) (+ (d count) (cont-frac-helper n d k (+ count 1))))
        0))
  (cont-frac-helper n d k 1))

;requires 11 iterations to converge to 0.6180 (= 1 / phi)
(cont-frac-rec (lambda (i) 1.0)
               (lambda (i) 1.0)
               11)