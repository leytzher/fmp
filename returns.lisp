(in-package :fmp)

(defvar +frequencies+ (make-hash-table))
(setf (gethash 'daily +frequencies+) 1)
(setf (gethash 'weekly +frequencies+) 5)
(setf (gethash 'bi-weekly +frequencies+) 10)
(setf (gethash 'monthly +frequencies+) 20)

(defun calculate-returns (&key ticker frequency)
  "Calculate simple returns at a given frequency"
  (let ((data (cadr (historical-prices :ticker ticker)))
	(freq (gethash frequency +frequencies+))
        (returns '()))
    (loop for i from (1- freq) to (1- (length data)) by freq
          do (let* ((current-period (nth i data))
                    (previous-period (nth (- i freq) data))
                    (current-close (cdr (assoc :ADJ-CLOSE current-period)))
                    (previous-close (cdr (assoc :ADJ-CLOSE previous-period)))
                    (simple-return (/ (- current-close previous-close) previous-close)))
               (push returns simple-return)))
    (nreverse returns)))
