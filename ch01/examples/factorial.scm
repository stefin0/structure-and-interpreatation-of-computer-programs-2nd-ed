(define (fact-rec n)
  (if (= n 1)
    1
    (* n (fact-rec (- n 1)))))

(define (fact-iter n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* counter product)
            (+ counter 1)))))
