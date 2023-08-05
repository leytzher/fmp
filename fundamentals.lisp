(in-package :fmp)

(defun financial-statement-symbol-lists ()
  "List of symbols that have financial statements"
  (return-json-v3 "financial-statement-symbol-lists"))


(defun annual-income-statement (&key ticker (limit 120))
  "Annual income statements"
  (return-json-v3 (concatenate
		   'string
		   "income-statement/"
		   ticker) (pairlis '("limit") `(,limit))))

(defun quarterly-income-statement (&key ticker (limit 400))
  "Quarterly income statements"
  (return-json-v3 (concatenate 'string "income-statement/" ticker)
		  (pairlis '("period" "limit") `("quarter" ,limit))))

(defun income-statement-by-cik (&key ticker (limit 400) (period "quarter"))
  "Get income statement by CIK"
  (return-json-v3 (concatenate 'string "income-statement/" ticker)
		  (pairlis '("period" "limit") `(,period ,limit))))
