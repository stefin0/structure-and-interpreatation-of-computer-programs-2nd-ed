#|
Exercise 1.5: Ben Bitdiddle has invented a test to determine
whether the interpreter he is faced with is using applicative-
order evaluation or normal-order evaluation. He defines the
following two procedures:
|#
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

; Then he evalutes the expression

(test 0 (p))

#|
What behavior will Ben observe with an interpreter that
uses applicative-order evaluation? What behavior will he
observe with an interpreter that uses normal-order evalu-
ation? Explain your answer. (Assume that the evaluation
rule for the special form if is the same whether the in-
terpreter is using normal or applicative order: The predi-
cate expression is evaluated first, and the result determines
whether to evaluate the consequent or the alternative ex-
pression.)
|#

#|
Applicative-order evaluation (evaluate the arguments and then apply): 
1. Let’s evaluate the combination
    (test 0 (p))
2. We begin by retrieving the body of test:
    (if (= x 0) 0 y)
3. Then we replace the formal parameter x by the argument 0 and formal 
   parameter y by the argument (p):
    (if (= 0 0) 0 (p))
4. Evaluation of (p) will result in an infinite loop.

Normal-order evaluation (fully expand and then reduce):
1. Let's evaluate the combination
    (test 0 (p))
2. Fully expand
2.1 (if (= x 0) 0 y))
2.2 (if (= 0 0) 0 (p)))
3. Then reduce
4. The result is 0; (p) is never evaluated because it's not needed.
|#
