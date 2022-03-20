#lang racket
(define (int->fb int)
  (match (list (= (modulo int 3) 0)
               (= (modulo int 5) 0))
    ['(#t #t) 'FizzBuzz]
    ['(#t #f) 'Fizz]
    ['(#f #t) 'Buzz]
    [_ int]))
                  
