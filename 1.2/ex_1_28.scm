#lang sicp

(define (square x) (* x x))

(define (mr-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (mr-prime? n (- times 1)))
        (else false)))

(define (mr-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

;Check for non-trivial square roots of one
(define (check-ntsr x n)
  (cond ((= x 1) x)
        ((= x (- n 1)) x)
        ((= (remainder (square x) n) 1) 0)
        (else x)))
         
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (check-ntsr (expmod base (/ exp 2) m ) m)) m))
        (else
         (remainder (* base (expmod base ( - exp 1) m ))
                    m))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (cond ((mr-prime? n 10)
         (report-prime n (- (runtime) start-time)))))

(define (report-prime n elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start count)
  (cond ((> count 0)
         (if (timed-prime-test start)
             (search-for-primes (+ start 2) (- count 1))
             (search-for-primes (+ start 2) count)))))

(timed-prime-test 6)
(timed-prime-test 7)
(timed-prime-test 1000)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10000)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)