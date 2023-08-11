(in-package :fmp)

(defun financial-statement-symbol-lists ()
  "List of symbols that have financial statements"
  (return-json-v3 "financial-statement-symbol-lists"))

;; Income Statement
;;;;;;;;;;;;;;;;;;;

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

;; Balance Sheet Statement
;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; Cash Flow Statement
;;;;;;;;;;;;;;;;;;;;;;

(defun annual-cash-flow (&key ticker (limit 120))
  "Annual cashflow statements"
  (return-json-v3 (concatenate 'string "cash-flow-statement/" ticker)
		  (pairlis '("limit") `(,limit))))

(defun quarterly-cash-flow (&key ticker (limit 120))
  "quarterly cashflow statements"
  (return-json-v3 (concatenate 'string "cash-flow-statement/" ticker)
		  (pairlis '("limit" "period") `(,limit "quarter"))))

(defun cash-flow-statement-by-cik (&key cik (limit 400) (period "quarter"))
  "Cashflow statements by cik"
  (return-json-v3 (concatenate 'string "cash-flow-statement/" cik)
		  (pairlis '("period" "limit") `(,period ,limit))))


;; Sales Revenue By Product
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun annual-revenue-breakdown (&key ticker)
  "Annual revenue by product"
  (return-json-v4 "revenue-product-segmentation"
		  (pairlis '("symbol" "structure") `(,ticker "flat"))))

(defun quarterly-revenue-breakdown (&key ticker)
  "Quarterly revenue by product"
  (return-json-v4 "revenue-product-segmentation"
		  (pairlis '("symbol" "structure" "period") `(,ticker "flat" "quarter"))))

;; Revenue Geographic by Segments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun annual-revenue-geographic-segmentation (&key ticker)
  "Annual revenue by geographic location"
  (return-json-v4 "revenue-geographic-segmentation"
		  (pairlis '("symbol" "structure") `(,ticker "flat"))))

(defun quarterly-revenue-geographic-segmentation (&key ticker)
  "Quarterly revenue by geographic location"
  (return-json-v4 "revenue-geographic-segmentation"
		  (pairlis '("symbol" "structure" "period") `(,ticker "flat" "quarter"))))

;; Shares float
;;;;;;;;;;;;;;

(defun shares-float (&key ticker)
  "Shares float for symbol"
  (return-json-v4 "shares_float" (pairlis '("symbol") `(,ticker))))

(defun all-latest-shares-float ()
  "All latest shares float available"
  (return-json-v4 "shares_float/all"))

;; Income statements as reported
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun annual-income-statement-as-reported (&key ticker (limit 10))
  "Income statements as reported"
  (return-json-v3 (concatenate 'string "income-statement-as-reported/"
			       ticker)
		  (pairlis '("limit") `(,limit))))

(defun quartely-income-statement-as-reported (&key ticker (limit 10))
  "Income statements as reported"
  (return-json-v3 (concatenate 'string "income-statement-as-reported/" ticker)
		  (pairlis '("limit" "period") `(,limit "quarter"))))

;; Balance sheet as reported
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun annual-balance-sheet-as-reported (&key ticker (limit 10))
  "Annual balance sheet statements"
  (return-json-v3 (concatenate 'string "balance-sheet-statement-as-reported/" ticker)
		  (pairlis '("limit") `(,limit))))

(defun quarterly-balance-sheet-as-reported (&key ticker (limit 10))
  "Annual balance sheet statements"
  (return-json-v3 (concatenate 'string "balance-sheet-statement-as-reported/" ticker)
		  (pairlis '("limit" "period") `(,limit "quarter"))))

;; Cash flow statement as reported
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun annual-cashflow-as-reported (&key ticker (limit 10))
  "Annual cash flow statements"
  (return-json-v3 (concatenate 'string "cash-flow-statement-as-reported/" ticker)
		  (pairlis '("limit") `(,limit))))

(defun quarterly-cashflow-as-reported (&key ticker (limit 10))
  "Annual cash flow statements"
  (return-json-v3 (concatenate 'string "cash-flow-statement-as-reported/" ticker)
		  (pairlis '("limit" "period") `(,limit "quarter"))))


