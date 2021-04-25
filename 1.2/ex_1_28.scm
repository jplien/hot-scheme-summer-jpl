#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

;Speed advantage is reduced by the need for an extra function call
; as shown when you call these nested version.  Each one adds ~3 seconds
; to the longest recursions
(define (nnn n)
  (nn n))

(define (nn n)
  (next n))

(define (next n)
  (if (= n 2)
       3
       (+ n 2)))

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
         (report-prime n (- (runtime) start-time)))))

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

(timed-prime-test 6)
(timed-prime-test 7)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)