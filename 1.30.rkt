#lang racket
; 1.30
#|
Exercise 1.30: The following sum procedure generates a linear recursion:

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
The procedure can be rewritten so that the sum is performed iteratively. Show how to do this by filling in the missing expressions in the following definition:

(define (sum term a next b)
  (define (iter a result)
    (if ⟨??⟩
        ⟨??⟩
        (iter ⟨??⟩ ⟨??⟩)))
  (iter ⟨??⟩ ⟨??⟩))
|#
(define (identity n) n)
(define (cube n) (* n n n))
(define (square n) (* n n))
(define (inv-square n) (/ 1.0 (* n n)))
(define (inc n) (+ n 1))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))
    )
  
  )
  (iter a 0)
)

(sum square 1 inc 10)
; altnerative invocation using a lambda
(sum (lambda (x) (* x x)) 1 (lambda (n) (+ n 1)) 10)