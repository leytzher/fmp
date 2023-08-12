(in-package :fmp)

;; Get institutional ownership for certain stocks.

(defun institutional-holders-search (&key name)
  "It uses name of the institution (eg. Berkshire Hathaway) to search for their CIK and also to check
if the CIK is being used in institutional ownership endpoints"
  (return-json-v4 "institutional-ownership/name/" (pairlis '("name") `(,(format-query-string name)))))

(defun institutional-holding-portfolio-positions-summary-by-cik (&key cik)
  (return-json-v4 "institutional-ownership/portfolio-holdings-summary" (pairlis '("cik") `(,cik))))

(defun institutional-holding-portfolio-positions-summary-by-name (&key name)
  (let* ((search-results (institutional-holders-search :name name))
	 (cik (cdr (assoc :cik (car search-results)))))
    (return-json-v4 "institutional-ownership/portfolio-holdings-summary" (pairlis '("cik") `(,cik)))))


;;; stock ownership by holders

(defun stock-ownership-by-holders (&key ticker date (page 0))
  "Date in YYY-MM-YY format"
  (return-json-v4 "institutional-ownership/institutional-holders/symbol-ownership-percent" (pairlis '("symbol" "page" "date")
												    `(,ticker ,page ,date))))

;; institutional holders RSS feed
(defun institutional-holders-rss-feed ()
  (return-json-v4 "institutional-ownership/rss_feed" (pairlis '("page") '(0))))


;; institutional holders list
(defun institutional-holders-list ()
  (return-json-v4 "institutional-ownership/list"))

;; institutional holders available date
(defun institutional-holders-portfolio-by-date (&key cik)
  (return-json-v4 "institutional-ownership/portfolio-date" (pairlis '("cik") `(,cik))))
