#lang sicp
; Exercise 1.8

; “Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value”

; ((x/y^2)+2y)/3

; “Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In section 1.3.4 we will see how to implement Newton's method in general
; as an abstraction of these square-root and cube-root procedures.)”

; Solution:

(define (cube x) (* x x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000000001))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (cube-root x)
  (cube-root-iter 1.0 x))
