#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter n d k acc)
;    (newline)
;    (display acc)
    (if (= k 0)
        acc
        (cont-frac-iter n d (- k 1) (/ (n k) (+ (d k) acc)))))
  (cont-frac-iter n d (- k 1) (/ (n k) (d k))))

;requires 8 iterations to converge to 2.7182
(define (tan-cf x k)
  (/ x (+ 1 (cont-frac (lambda (i) (- (* x x)))
                       (lambda (i) (+ (* 2 i) 1))
                       (- k 1)))))

(tan-cf 0 10)
(tan-cf 0.5235987755982988 10) ; s/b 0.5773502691896257 = (/ (sqrt 3) 3)
(tan-cf 0.7853981633974483 10) ; s/b 1.0
