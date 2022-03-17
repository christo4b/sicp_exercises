#lang racket
; 1.17

#|

Exercise 1.17: The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))
This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

|#

(define (double n) (* n 2))
(define (half n) (/ n 2))

(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))

(define (fast-mul a b)
  (cond ((= b 0)) 0)
        ((= b 1) a)
        ((even? b (fast-mul (double a) (half b))))  ; 5 * 8 -> 10 * 4 -> 20 * 2 -> 40 * 1
        (else (+ a (fast-mul a (- b 1)))))


