#lang racket
#|
Exercise 1.31:

The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures. Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to pi using the formula
pi   2 * 4 * 4 * 6 * 6 * 8 ...
-- = -------------------------
 4   3 * 3 * 5 * 5 * 7 * 7 ...
If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.
|#

(define (identity n) n)
(define (cube n) (* n n n))
(define (square n) (* n n))
(define (inv-square n) (/ 1.0 (* n n)))
(define (inc n) (+ n 1))


; Linear recursion:

(define (product func start next end)
  (if (> start end)
      1
      (* (func start)
         (product func (next start) next end))))
         
; iterative:

(define (product-it func start next end)
  (define (iter start result)
    (if (> start end)
        result
        (iter (next start) (+ result (func start)))
    )
  )
  (iter start 0)
)

