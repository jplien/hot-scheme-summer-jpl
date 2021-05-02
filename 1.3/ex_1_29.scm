#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))
        
(define (simp-integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x)
    (+ x (* 2 h)))
  (* (/ (/ (- b a) n) 3)
     (+ (f a)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f (add-2h a) add-2h (- b h)))
        (f b))))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(simp-integral cube 0.0 1 100)
(simp-integral cube 0.0 1 1000)