(define (fib-rec n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-rec (- n 1))
                 (fib-rec (- n 2))))))

(define (fib-iter n)
  (iter 1 0 n))
(define (iter a b count)
  (if (= count 0)
    b
    (iter (+ a b) a (- count 1)))))
