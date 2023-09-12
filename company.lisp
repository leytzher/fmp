
(in-package :fmp)

;; Get institutional ownership for certain stocks.

(defun company-information (ticker)
  (car (return-json-v4 "company-core-information" (pairlis '("symbol") `(,(format-query-string ticker))))))
