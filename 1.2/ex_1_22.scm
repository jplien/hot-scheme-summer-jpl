#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (cond ((prime? n)
         (report-prime n (- (runtime) start-time))
         #t)
        (else #f)))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start count)
  (cond ((> count 0)
         (if (timed-prime-test start)
             (search-for-primes (+ start 2) (- count 1))
             (search-for-primes (+ start 2) count)))))

(search-for-primes 1001 3)
(search-for-primes 10001 3)
(search-for-primes 100001 3)
(search-for-primes 1000001 3)