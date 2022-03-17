#lang racket

#|
Exercise 1.32:

Show that sum and product are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
(accumulate combiner null-value term a next b)
Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.

If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.
|#
(define (identity n) n)
(define (cube n) (* n n n))
(define (square n) (* n n))
(define (inv-square n) (/ 1.0 (* n n)))
(define (inc n) (+ n 1))
(define (sum a b) (+ a b))
(define (mul a b) (* a b))

(define (accumulate combiner null-value func start next end)
  (if (> start end)
      null-value
      (combiner (func start)
          (accumulate combiner null-value func (next start) next end)))
)

; iterative:

(define (accumulate-it combiner null-value func start next end)
  (define (iter start result)
    (if (> start end)
        result
        (iter (next start) (combiner result (func start)))
    )
  )
  (iter start null-value)
)
(accumulate sum 0 identity 1 inc 5)
(accumulate mul 1 identity 1 inc 5)
(accumulate-it sum 0 identity 1 inc 5)
(accumulate-it mul 1 identity 1 inc 5)