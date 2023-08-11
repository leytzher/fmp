(in-package :fmp)

;; Financial Ratios
;;;;;;;;;;;;;;;;;;;

(defun ratios (&key ticker (limit 10) (period "annual"))
  "Financial ratios. Period can be either annual or quarter"
  (return-json-v3 (concatenate 'string "ratios/" ticker) (pairlis '("limit" "period") `(,limit ,period))))


;; Stock financial scores
;;;;;;;;;;;;;;;;;;;;;;;;;

;; Altman Z-Score and Piotroski score

(defun score (&key ticker)
  (return-json-v4 "score" (pairlis '("symbol") `(,ticker))))


;; Company Enterprise Value
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Get a company enterprise value based on its financial statement, it is calculated from Market Value.
;; The enterprise value is a proportion of an organization's absolute worth

(defun enterprise-value (&key ticker)
  (return-json-v3 (concatenate 'string "enterprise-value/" ticker)))


;; Financial Satements Growth
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; how a company has grown since its IPO.

(defun income-statement-growth (&key ticker)
  (return-json-v3 (concatenate 'string "income-statement-growth/" ticker)))


;; Company Key Metrics
;;;;;;;;;;;;;;;;;;;;;;
;; get compnay key metrics such as Market Cap, PE Ratio, Price to Sales Ratio, POCF Ratio, Graham Net-Net.

(defun key-metrics (&key ticker (period "annual"))
  "Period can be annual or quarter"
  (return-json-v3 (concatenate 'string "key-metrics/" ticker)
		  (pairlis '("period") `(,period))))

;; trailing 12 months (TTM)
(defun key-metrics-ttm (&key ticker (period "annual") (limit "400"))
  "Period can be annual or quarter"
  (return-json-v3 (concatenate 'string "key-metrics-ttm/" ticker)
		  (pairlis '("period" "limit") `(,period ,limit))))


;; Company Financial Growth
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compares its previous financial statement to get growth of all its statement.
;; this can be calculated quarter by quarter or year by year.

(defun financial-growth (&key ticker (period "annual"))
  "Period can be annual or quarter"
  (return-json-v3 (concatenate 'string "financial-growth/" ticker)
		  (pairlis '("period" ) `(,period ))))

;;; Company Rating
;;;;;;;;;;;;;;;;;;

;; Get the rating of a company based on its financial statement, discounted cashflow analyisis, financial ratios and its intrinsic value.

(defun rating (&key ticker)
  (return-json-v3 (concatenate 'string "rating/" ticker)))


;; Company Discounted cash flow value
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This represents a stock instrinsic value calculated from its free cash flow analysis.
;; if the value is over the current stock price the stock is considered undervalued and vice versa.


(defun discounted-cash-flow-value (&key ticker)
  (return-json-v3 (concatenate 'string "discounted-cash-flow/" ticker)))

(defun historical-discounted-cash-flow-value (&key ticker (period "annual"))
  (return-json-v3 (concatenate 'string "historical-discounted-cash-flow-statement/" ticker)
		  (pairlis '("period") `(,period))))

