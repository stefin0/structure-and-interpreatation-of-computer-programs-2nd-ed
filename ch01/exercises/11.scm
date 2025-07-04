#|
Exercise 1.11: A function f is defined by the rule that

f(n) = n if n < 3, f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

Write a procedure that computes f by means of a recursive
process. Write a procedure that computes f by means of an
iterative process.
|#

; recursive process
(define (f-rec n)
  (cond ((< n 3) n)
        ((or (> n 3) (= n 3))
         (+ (f-rec (- n 1))
            (* 2 (f-rec (- n 2)))
            (* 3 (f-rec (- n 3)))))))

; iterative process
; hint: use (probably 3) state variables
(define (f-iter n)
  (if (< n 3)
      n
      (iter 2 1 0 (- n 2))))

(define (iter a b c count)
  (if (= count 0)
      a
      (iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))
