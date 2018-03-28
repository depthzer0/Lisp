;(defparameter arr (read))
(defparameter arr #3A((("R" "Lisp" "Python" "perl") ("C" "Lisp" "Pascal" "D")) (("SQL" "Java" "Pascal" "Lisp") ("Nemerle" "R" "Julia" "piet")) (("C++" "Oberon" "C" "Pascal") ("Lisp" "Python" "Ruby" "FORTRAN"))))
(defparameter alist nil)
(defparameter max-val 0)

(defun check-arr()
    (dotimes (i (array-dimension arr 0))
        (dotimes (j (array-dimension arr 1))
            (dotimes (k (array-dimension arr 2))
                (let  ((e (assoc (aref arr i j k) alist :test #'equalp)))
                    (if e 
                        (progn (setf e (incf (cdr e))) (setf max-val (max max-val e)))
                        (push (cons (aref arr i j k) 1) alist))))))
    (push '("Lisp2" . 4) alist)
    (print (rassoc max-val alist))
    (print alist))

(check-arr)

(defun sumarr(curV)
        (let  ((e (assoc curV alist :test #'equalp)))
            (if e 
            (setf e (incf (cdr e)))
            (push (cons curV 1) alist))))

;(check-arr)

