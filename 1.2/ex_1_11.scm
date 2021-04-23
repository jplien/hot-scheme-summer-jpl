#lang sicp

(define (f_iter n)
  (if (< n 3)
      n
      (+ (f_iter (- n 1)) (* 2 (f_iter (- n 2))) (* 3 (f_iter (- n 3))))))

(f_iter 1)
(f_iter 2)
(f_iter 3)
(f_iter 4)
(f_iter 5)
(f_iter 10)


(define (f_iter_tail a b c count)
  (if (= count 0)
      a
      (f_iter_tail (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(define (f_tail n)
  (if (< n 3)
      n
      (f_iter_tail 2 1 0 (- n 2))))

(f_tail 1)
(f_tail 2)
(f_tail 3)
(f_tail 4)
(f_tail 5)
(f_tail 10)