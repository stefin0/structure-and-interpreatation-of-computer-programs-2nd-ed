#|
Exercise 1.11: A function f is defined by the rule that

f(n) = n if n < 3, f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

Write a procedure that computes f by means of a recursive
process. Write a procedure that computes f by means of an
iterative process.
|#

; recursive process
(define (f-recursive n)
  (cond ((< n 3) n)
        ((or (> n 3) (= n 3))
         (+ (f-recursive (- n 1))
            (* 2 (f-recursive (- n 2)))
            (* 3 (f-recursive (- n 3)))))))

; iterative process
; hint: use (probably 3) state variables
(define (f-iterative n)
  (f-iter 

(define (f-iter a b c count)
  (cond ((< count 3) count)
        ((or (> n 3) (= n 3))
         ())))
