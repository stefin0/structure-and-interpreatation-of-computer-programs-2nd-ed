#|
Exercise 1.3: Define a procedure that takes three numbers as arguments and 
returns the sum of the squares of the two larger numbers.
|#
(define (square x)
  (* x x))

(define (sum-squares-of-two-largest x y z)
    (cond ((and (<= x y) (<= x z))
                (+ (square y) (square z)))
          ((and (<= y x) (<= y z))
                (+ (square x) (square z)))
          (else
                (+ (square x) (square y)))))
