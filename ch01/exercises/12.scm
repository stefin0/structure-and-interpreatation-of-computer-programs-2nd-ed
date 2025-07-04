#|
Exercise 1.12: The following pattern of numbers is called
Pascal’s triangle.

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1

The numbers at the edge of the triangle are all 1, and each
number inside the triangle is the sum of the two numbers
above it. Write a procedure that computes elements of
Pascal’s triangle by means of a recursive process.
|#

(define (pascals-triangle row col)
  (cond ((> col row) 0) ; out of bounds
        ((or (= col 0) (= row col)) 1) ; edge of triangle
        (else (+ (pascals-triangle (- row 1) (- col 1))
                 (pascals-triangle (- row 1) col)))))

; (display "The value of 0 0 is ")
; (display (pascals-triangle 0 0))
; (newline)
;
; (display "The value of 1 0 is ")
; (display (pascals-triangle 1 0))
; (newline)
;
; (display "The value of 1 1 is ")
; (display (pascals-triangle 1 1))
; (newline)
;
; (display "The value of 2 0 is ")
; (display (pascals-triangle 2 0))
; (newline)
;
; (display "The value of 2 1 is ")
; (display (pascals-triangle 2 1))
; (newline)
;
; (display "The value of 2 2 is ")
; (display (pascals-triangle 2 2))
; (newline)
;
; (display "The value of 3 0 is ")
; (display (pascals-triangle 3 0))
; (newline)
;
; (display "The value of 3 1 is ")
; (display (pascals-triangle 3 1))
; (newline)
;
; (display "The value of 3 2 is ")
; (display (pascals-triangle 3 2))
; (newline)
;
; (display "The value of 3 3 is ")
; (display (pascals-triangle 3 3))
; (newline)

#|
2,1 -> 1,0 & 1,1
3,2 -> 2,1 & 2,2
|#
