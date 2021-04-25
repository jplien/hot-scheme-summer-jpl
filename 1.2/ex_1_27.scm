#lang sicp


(define (square x) (* x x))

(define (fast-prime? n count)
  (cond ((= count n) true)
        ((fermat-test n count) (fast-prime? n (+ count 1)))
        (else false)))

(define (fermat-test n m)
    (= (expmod m n n) m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m ))
                    m))
        (else
         (remainder (* base (expmod base ( - exp 1) m ))
                    m))))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (cond ((fast-prime? n 10)
         (report-prime n (- (runtime) start-time)))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 561)
(timed-prime-test 1105)
(timed-prime-test 1729)
(timed-prime-test 1729)
(timed-prime-test 2821)
(timed-prime-test 6601)
