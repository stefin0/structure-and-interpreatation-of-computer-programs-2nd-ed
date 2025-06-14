#|
Exercise 1.4: Observe that our model of evaluation allows
for combinations whose operators are compound expres-
sions. Use this observation to describe the behavior of the
following procedure:
|#
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 1 -2)

#|
If b > 0 then the addition operator will be the result, otherwise the 
subtraction operator will be the result. Then, the resulting operator will 
add or subtract a and b.
|#
