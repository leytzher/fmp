(in-package :fmp)

(defun tradable-symbols ()
  (return-json-v3 "available-traded/list"))

(defun stock-list ()
  (return-json-v3 "stock/list"))

(defun etf-list ()
  (return-json-v3 "etf/list"))
