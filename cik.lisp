(in-package :fmp)
;; List with names and their CIK

(defun mapper-cik-name (&key (page 0))
  (return-json-v4 "mapper-cik-name" (pairlis '("page") `(,page) )))

