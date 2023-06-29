(in-package :fmp)

(defun validate-period (value)
  "Check to see if passed string is in the list of possible time periods."
  (cond ((member value *period-values* :test #'string=)
	 value)
	(t (format t "Invalid period. It must be one of ~a:" *period-values*))))

(defun validate-sector (value)
  "Check to see if passed string is in the list of possible sectors."
  (cond ((member (serapeum:string-upcase-initials value) *sector-values* :test #'string=)
	 (serapeum:string-upcase-initials value))
	(t (format t "Invalid sector. It must be one of ~a:" *sector-values*))))

(defun validate-industry (value)
  "Check to see if passed string is in the list of possible industries."
  (cond ((member (serapeum:string-upcase-initials value) *industry-values* :test #'string=)
	 (serapeum:string-upcase-initials value))
	(t (format t "Invalid industry. It must be one of ~a:" *industry-values*))))

(defun validate-time-delta (value)
  "Check to see if passed string is in the list of possible time delta periods."
  (cond ((member value *time-delta-values* :test #'string=)
	 value)
	(t (format t "Invalid time delta. It must be one of ~a:" *time-delta-values*))))

(defun validate-series-type (value)
  "Check to see if passed string is in the list of possible series type."
  (cond ((member value *series-type-values* :test #'string=)
	 value)
	(t (format t "Invalid series type. It must be one of ~a:" *series-type-values*))))

(defun validate-statistics-type (value)
  "Check to see if passed string is in the list of possible statistics type."
  (cond ((member value *statistics-type-values* :test #'string=)
	 value)
	(t (format t "Invalid statistics type. It must be one of ~a:" *statistics-type-values*))))

(defun validate-technical-indicators-time-delta (value)
  "Check to see if passed string is in the list of possible technical indicators time delta values."
  (cond ((member value *technical-indicators-time-delta-values* :test #'string=)
	value)
	(t (format t "Invalid technical indicators time delta. It must be one of ~a:" *technical-indicators-time-delta-values*))))
