(defun fib-n-memo(n &optional arr-memo)
    (if (null arr-memo) (progn (setf arr-memo (make-array 100 :initial-element nil)) (setf (aref arr-memo 0) 1) (setf (aref arr-memo 1) 1)))
    (if (null (aref arr-memo n))
        (setf (aref arr-memo n) (+ (fib-n (- n 1)) (fib-n (- n 2))))
        (aref arr-memo n)))

(defun fib-n(n)
    (if (< n 2)
        1
        (+ (fib-n (- n 1)) (fib-n (- n 2)))))

(defun find-odds(lst)
    (let ((cnt 0) (odd-lst)) 
        (dolist (i lst)
            (when (oddp i) (push i odd-lst) (incf cnt)))
        (values cnt (nreverse odd-lst))))

;(multiple-value-bind (cnt lst) (find-odds '(1 2 3 4 5 6 7)) (print cnt) (print lst))

(defun sum-n(arr n)
    (let ((res 0))
        (dotimes (i n)
            (incf res (aref arr i)))
        res))

;(print (sum-n (vector 1 2 3 4) 3))