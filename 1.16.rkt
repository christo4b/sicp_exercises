#lang racket

; 1.16 Design an iterative version of the fast-expt procedure given above. Hint: To do this, remember that iteration involves carrying the result and all other information forward from the previous step.

(define (fast-expt b n)
    (define (iter b n result)
        (cond ((= n 0) result)
	      ((even? n) (iter( * b b) (/ n 2) result)) 
	      (else (iter b (- n 1) (* b result)))))
    (iter b n 1)
)

;;; Here's the inefficient procedure presented by teh book:

#|
(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (fast-expt (* b b) (/ n 2)))
	  (else (* b (fast-expt b (- n 1))))))
|#

