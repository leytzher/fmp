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

(defun income-statement-by-cik (&key cik (limit 400) (period "quarter"))
  "Get income statement by CIK"
  (return-json-v3 (concatenate 'string "income-statement/" cik)
		  (pairlis '("period" "limit") `(,period ,limit))))

(defun annual-balance-sheet (&key ticker (limit 120))
  "Annual Balance sheet statements"
  (return-json-v3 (concatenate 'string "balance-sheet-statement/" ticker)
		  (pairlis '("limit") `(,limit))))

(defun quarterly-balance-sheet (&key ticker (limit 400))
  "Quarterly Balance Sheet statements"
  (return-json-v3 (concatenate 'string "balance-sheet-statement/" ticker)
		  (pairlis '("limit" "period") `(,limit "quarter"))))


(defun balance-sheet-by-cik (&key cik (limit 400) (period "quarter"))
  "Get balance sheet statement by CIK"
  (return-json-v3 (concatenate 'string "balance-sheet-statement/" cik)
		  (pairlis '("period" "limit") `(,period ,limit))))


(defun annual-cash-flow (&key ticker (limit 120))
  "Annual cashflow statements"
  (return-json-v3 (concatenate 'string "cash-flow-statement/" ticker)
		  (pairlis '("limit") `(,limit))))

(defun quarterly-cash-flow (&key ticker (limit 120))
  "quarterly cashflow statements"
  (return-json-v3 (concatenate 'string "cash-flow-statement/" ticker)
		  (pairlis '("limit" "period") `(,limit "quarter"))))
