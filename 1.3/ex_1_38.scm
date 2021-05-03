#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter n d k acc)
;    (newline)
;    (display acc)
    (if (= k 0)
        acc
        (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) acc)))))
  (cont-frac-iter n d (- k 1) (/ (n k) (d k))))

(define (d-func k)
  (cond ((= (remainder k 3) 0) 1)
        ((= (remainder k 3) 1) 1)
        ((= (remainder k 3) 2) (* 2 (ceiling (/ k 3))))))

;requires 8 iterations to converge to 2.7182
(+ 2 (cont-frac (lambda (i) 1.0)
                d-func
                8))