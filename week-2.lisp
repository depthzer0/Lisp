(defvar *x*)

(defun process()
    (setq *x* (read))
    (dotimes (i (ceiling (integer-length *x*) 8))
        (setf *x* 
            (dpb
                (change-byte 
                    (ldb 
                        (byte 8 (* i 8)) 
                        *x*))
                (byte 8 (* i 8)) 
                *x*)))
    (print *x*))

(defun change-byte(bytes)
    (if (logbitp 0 bytes) (setf bytes (- bytes 1)))
    (if (logbitp 7 bytes) (setf bytes (- bytes #b10000000)))
    (setf bytes 
       (logior bytes #b00011000)))

(process)

(defun process-old()
    (let (x))
    (setq x (read))
    (dotimes (i (ceiling (integer-length x) 8))
        (setf x 
            (dpb
                (change-byte 
                    (ldb 
                        (byte 8 (* i 8)) 
                        x))
                (byte 8 (* i 8)) 
                x)))
    (print x))

(defun change-byte-old(bytes)
    (dotimes (i 4 bytes)
        (when 
            (not 
                (eq 
                    (logbitp i bytes)
                    (logbitp (- 7 i) bytes)))
            (setf bytes
                (logxor bytes 
                    (+ (ash 1 i) (ash 1 (- 7 i))))))))