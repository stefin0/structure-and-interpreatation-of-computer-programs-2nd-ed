#|
Exercise 1.7: The good-enough? test used in computing
square roots will not be very effective for finding the square
roots of very small numbers. Also, in real computers, arith-
metic operations are almost always performed with lim-
ited precision. This makes our test inadequate for very large
numbers. Explain these statements, with examples showing
how the test fails for small and large numbers.
|#

#|
Explanation: For very small numbers, the fixed tolerance of 0.001 is too large.
It allows for an answer to be considered "good-enough" even when the guess has
a very large relative error compared to the actual square root. For example,
the square root of 0.0000001 should be 0.000316, but the result is 0.031.
Explanation: For very large numbers, the fixed tolerance of 0.001 is too small.
Limited precision of arithmetic operations means that we might not be able to
represent the square of our guess with enough accuracy to get the difference
smaller than 0.001. For example, the square root of 1e50 should be 1e25, but
the result enters an infite loop.
|#

#|An alternative strategy for implementing good-enough? is to watch
how guess changes from one iteration to the next and to
stop when the change is a very small fraction of the guess.
Design a square-root procedure that uses this kind of end
test. Does this work better for small and large numbers?
|#
(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
    (improve guess x)
    (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; Returns True if the abs(new-guess - old-guess) < 0.0001 * new-guess
; e.g.,         x = 0.0000001
;       old-guess = 0.000316228
;       new-guess = 0.000316227
;       abs(0.000316228 - 0.000316227) = 0.000000001
;       0.00001 * 0.000316227 = 0.00000000316
;       0.000000001 < 0.00000000316
;       Thus, iteration stops
(define (good-enough? old-guess new-guess)
  (< (abs (- new-guess old-guess)) (* 0.00001 new-guess)))

(define (sqrt x)
    (sqrt-iter 1.0 x)))
