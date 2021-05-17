#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (let ((u1 (- (lower-bound x) (upper-bound y)))
        (u2 (- (upper-bound x) (lower-bound y))))
  (make-interval (min u1 u2)
                 (max u1 u2))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
;  (if (or (and (> (upper-bound y) 0) (> (lower-bound y) 0))
;          (and (< (upper-bound y) 0) (< (lower-bound y) 0)))
  (if (= (- (abs (upper-bound y)) (abs (lower-bound y))) (abs (- (upper-bound y) (lower-bound y))))
      (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))
      (make-interval 0 0)))

(define (make-interval a b) (cons a b))
(define (upper-bound z) (cdr z))
(define (lower-bound z) (car z))

(define z1 (make-interval 4 8))
(define z2 (make-interval 1 2))
(define z3 (make-interval -1 2))

(div-interval z1 z2)
(div-interval z1 z3)