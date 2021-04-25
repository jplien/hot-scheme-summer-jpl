#lang sicp

;(define (smallest-divisor n)
;  (find-divisor n 2))
;
;(define (find-divisor n test-divisor)
;  (cond ((> (square test-divisor) n) n)
;        ((divides? test-divisor n) test-divisor)
;        (else (find-divisor n (+ test-divisor 1)))))
;
;(define (divides? a b)
;  (= (remainder b a) 0))

(define (square x) (* x x))

;(define (prime? n)
;  (= n (smallest-divisor n)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

; Since log 1E6 ~ 20
;   and log 1E3 ~ 10
;   largest run should take 2x longer
; Observed run is only 1.5x longer
; Presumably this is due to the constant component of runtime,
; as comparing larger numbers gets closer to the log ratio.

(search-for-primes 1001 3)
(search-for-primes 10001 3)
(search-for-primes 100001 3)
(search-for-primes 1000001 3)
(search-for-primes 1000000001 3)