;;
;;  Ryan Boudreaux
;;  Completed 1/19/18
;;
;;

(defun DOT-PRODUCT (a b) (
    reduce #'+ (mapcar #'* a b)
))

(defun COUNT-NUMBERS (list) (
    count-if #'numberp list)
)

(defun NEW-LIST (size) (
    make-list size :initial-element T
))

(defun ALL-LENGTH (x)
    (cond ((null x) 0)(
        (not (listp x)) 1
    )
    (t (+
        (if (atom (first x)) 1
            (ALL-LENGTH (first x))
        )
        (ALL-LENGTH (rest x))
        ))
    )
)
(print :)
(princ "Result for function (DOT-PRODUCT '(1.2 2.0 -0.2) '(0.0 2.3 5.0)): ")
(prin1 (DOT-PRODUCT '(1.2 2.0 -0.2) '(0.0 2.3 5.0)))
(print :)
(princ "Result for function (COUNT-NUMBERS '(a b 3 5 d 3 4)): ")
(prin1 (COUNT-NUMBERS '(a b 3 5 d 3 4)))
(print :)
(princ "Result for function (NEW-LIST 5): ")
(prin1 (NEW-LIST 5))
(print :)
(princ "Result for function (ALL-LENGTH '(A B C): ")
(prin1 (ALL-LENGTH '(A B C)))
(print :)
(princ "Result for function (ALL-LENGTH '(A (B C) D (E F))): ")
(prin1 (ALL-LENGTH '(A (B C) D (E F))))
(print :)
(princ "Result for function (ALL-LENGTH '(NIL NIL (NIL NIL) NIL): ")
(prin1 (ALL-LENGTH '(NIL NIL (NIL NIL) NIL)))
