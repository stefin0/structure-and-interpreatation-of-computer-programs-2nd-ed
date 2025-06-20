#|
Exercise 1.6: Alyssa P. Hacker doesn’t see why if needs to
be provided as a special form. “Why can’t I just define it as
an ordinary procedure in terms of cond?” she asks. Alyssa’s
friend Eva Lu Ator claims this can indeed be done, and she
defines a new version of if:

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
5
(new-if (= 1 1) 0 5)
0

Delighted, Alyssa uses new-if to rewrite the square-root
program:
(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

What happens when Alyssa attempts to use this to compute
square roots? Explain.
|#

#|
The program will enter an infinite recursion.

The issue is that new-if is an ordinary procedure, and Scheme uses
applicative-order evaluation for ordinary procedures.

applicative-order evaluation means: evaluate all arguments first, then apply
the procedure to the results.

Let's trace what happens when Alyssa calls (sqrt 2), which in turn calls
(sqrt-iter 1.0 2):
    1. The initial call is (sqrt 1.0 2)
    2. Inside sqrt-iter, the interpreter encounters:
        (new-if (good-enough? 1.0 2)      ; Argument 1: predicate
            1.0                      ; Argument 2: then-clause
            (sqrt-iter (improve 1.0 2) 2)) ; Argument 3: else-clause
    3. Because new-if is a regular procedure, the interpreter must evaluate
    all three of its arguments before i can execute the cond statement inside
    the body of new-if.
        * It evaluates argument 1: (good-enough? 1.0 2) which becomes 
        (good-enough? 1 2), which is #f (false)
        * It evaluates argument 2: 1.0, which is just 1.0
        * It must evaluate argument 3: (sqrt-iter (improve 1.0 2) 2)
    4. Here is the fatal flaw. To evaluate argument 3, the interpreter must
    first evaluate the arguments to that sqrt-iter call.
        * (improve 1.0 2) evaluate to 1.5
        * So, argument 3 becomes a new call: (sqrt 1.5 2)
    5. To evaluate (sqrt-iter 1.5 2), the interpreter must once again evaluate
    the arguments to its new-if call. The means it must evaluate:
    (sqrt (improve 1.5 2) 2)

Evaluating the else-clause of new-if requires another call to sqrt-iter, which
in turn requires evaluating its else-clause, leading to another call to
sqrt-iter, and so on.

The interpreter will continuously call sqrt-iter to evaluate the third argument
for new-if, and it will never actually get to the point of applying the new-if
procedure itself. The "base case" of the recursion, (good-enough? guess x), is
evaluated, but its result is never used to stop the chain of recursive calls.

if cannot be implemented as an ordinary procedure in a language with
applicative-order evaluation. The built-in if is a special form. This means it
does not follow the standard rule of evaluating all its arguments. Instead, its
special evaluation rule is:
    1. Evaluate the predicate.
    2. If the predicate is true, evaluate only the then-clause.
    3. If the predicate is false, evaluate only the else-clause.

The unevaluated clause is completely ignored. This ability to selectively
evaluate a branch is what allows if to properly terminate a recursion. Alyssa's
new-if procedure lacks this power.
|#
