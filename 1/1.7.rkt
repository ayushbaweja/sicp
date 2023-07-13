#lang sicp
; Exercise 1.7

; “The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers.
; Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for
; very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy
; for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction
; of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?”

; Solution:

; For very small errors, the hardocded margin of error 0.001 is to large to get an accurate square. For large numbers, the sqaure cannot be represented within 0.001 of the square of x unless it
; itself is x.

(define (square x) (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))


