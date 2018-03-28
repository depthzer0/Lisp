(defun find-odds(lst)
    (let ((cnt 0) (odd-lst)) 
        (dolist (i lst)
            (when (oddp i) (push i odd-lst) (incf cnt)))
        (values cnt (nreverse odd-lst))))

(multiple-value-bind (cnt lst) (find-odds '(1 2 3 4 5 6 7)) (print cnt) (print lst))

(defun sum-n(arr n)
    (let ((res 0))
        (dotimes (i n)
            (incf res (aref arr i)))
        res))

;(print (sum-n (vector 1 2 3 4) 3))