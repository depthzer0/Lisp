(defparameter test-list '("a" "a" "b" "c" "a" "x" "b" "a" "x"))
(defparameter alist nil)

(defun test()
    (dolist (i test-list)
        (let ((e (assoc i alist :test #'equalp))) 
            (if e (setf e (incf (cdr e))) (push (cons i 1) alist)))
        (print i))
    (print alist))

(test)