(in-package :fmp)

(defun tradable-symbols ()
  (return-json-v3 "available-traded/list"))

(defun stock-list ()
  (return-json-v3 "stock/list"))


(defclass security-info ()
  ((ticker :accessor ticker :initarg :ticker)
   (name :accessor name :initarg :name)
   (exchange :accessor exchange :initarg :exchange)
   (exchange-short-name :accessor exchange-short-name :initarg :exchange-short-name)
   (security-type :accessor security-type :initarg :security-type)))


(defun make-security-list (&optional (tradable t))
  "Create a list of CLOS objects containing security information"
  (let ((data (if tradable
		  (tradable-symbols)
		  (stock-list))))
    (mapcar #'(lambda (x)
		(make-instance 'security-info
			       :ticker (cdr (assoc :symbol x))
			       :name (cdr (assoc :name x))
			       :exchange (cdr (assoc :exchange x))
			       :exchange-short-name (cdr (assoc :exchange-short-name x))
			       :security-type (cdr (assoc :type x))))
	    data)))


(defmacro filter-security-by (&key attribute  value on-list)
  "Filter securities by attribute/value. Usage: (filter-security-by 'security-type \"etf\" stock-list)"
  `(remove-if-not #'(lambda (x) (string-equal (slot-value x ,attribute) ,value) ) ,on-list))
