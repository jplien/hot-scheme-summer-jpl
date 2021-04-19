#lang sicp
(define (ex13 a b c)
  (cond ((and (>= a c) (>= b c)) (+ (* a a) (* b b)))
        ((and (>= a b) (>= c b)) (+ (* a a) (* c c)))
        ((and (>= b a) (>= c a)) (+ (* b b) (* c c)))))
(ex13 1 2 3)
(ex13 2 1 3)
(ex13 2 3 1)
(ex13 1 1 1)
(ex13 1 2 1)

