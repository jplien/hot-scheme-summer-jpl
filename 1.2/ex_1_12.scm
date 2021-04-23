#lang sicp

(define (pascal m n)
  (cond ((< m 0) 0)
        ((> m n) 0)
        ((= m 0) 1)
        ((= m n) 1)
        (else (+ (pascal (- m 1) (- n 1)) (pascal m (- n 1))))))

(pascal 0 0)
(pascal 0 1)
(pascal 1 2)
(pascal 2 3)
(pascal 2 4)