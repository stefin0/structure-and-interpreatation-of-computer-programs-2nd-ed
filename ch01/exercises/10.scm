#|
Exercise 1.10: e following procedure computes a math-
ematical function called Ackermann’s function.
|#

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

#|
What are the values of the following expressions?

(A 1 10)
  > (A 0 (A 1 9))
  > (* 2 (A 1 9))
  > (* 2 (A 0 (A 1 8)))
  > (* 2 (* 2 (A 1 8)))
  > (* 2 (* 2 (A 0 (A 1 7))))
  > (* 2 (* 2 (* 2 (A 1 7))))
  > ...
  > (* 2 (* 2 (*2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (A 1 1))))))))))
  > (* 2 (* 2 (*2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 2)))))))))
  > (* 2 (* 2 (*2 (* 2 (* 2 (* 2 (* 2 (* 2 4))))))))
  > (* 2 (* 2 (*2 (* 2 (* 2 (* 2 (* 2 8)))))))
  > ...
  > 1024
  > ... we see that (A 0 n) is 2n

(A 2 4)
  > (A 1 (A 2 3))
  > (A 1 (A 1 (A 2 2)))
  > (A 1 (A 1 (A 1 2)))
  > (A 1 (A 1 (A 0 (A 1 1))))
  > (A 1 (A 1 (A 0 2)))
  > (A 1 (A 1 (* 2 2)))
  > (A 1 (A 1 4))
  > (A 1 (A 0 (A 1 3)))
  > (A 1 (A 0 (A 0 (A 1 2))))
  > (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
  > (A 1 (A 0 (A 0 (A 0 2))))
  > (A 1 (A 0 (A 0 (* 2 2))))
  > (A 1 (A 0 (A 0 4)))
  > (A 1 (A 0 (* 2 4)))
  > (A 1 (A 0 8))
  > (A 1 (* 2 8))
  > (A 1 16)
  > ... following the pattern of (A 1 n) = 2^n
  > (A 1 16) = 2^16 = 65536

(A 3 3)
  > (A 2 (A 3 2))
  > (A 2 (A 2 (A 3 1)))
  > (A 2 (A 2 2))
  > (A 2 (A 1 (A 2 1)))
  > (A 2 (A 1 2))
  > ... using the pattern of (A 1 n) = 2^n
  > (A 2 4)
  > ... we already know the value of (A 2 4) from the previous explanation
  > (A 2 4) = 65536
  > we see that (A 2 n) = tower of powers of 2, with a height of n.
  > (A 3 3) = 2^2^2^2

Consider the following procedures, where A is the proce-
dure defined above:

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

Give concise mathematical definitions for the functions com-
puted by the procedures f, g, and h for positive integer val-
ues of n. For example, (k n) computes 5n^2.
(f n) computes 2n
(g n) computes 2^n
(h n) computes tower of power of 2, with a height of n.

"Ultimately, this exercise teaches you that a few simple, elegant rules can
generate complexity beyond imagination, and that your most powerful tool as a
programmer is the ability to recognize the beautiful, abstract patterns hiding
within that complexity. You don't just know the answer to Exercise 1.10 now—you
understand why it's an important and famous problem in computer science."
--Gemini
|#
