(in-package :fmp)

;; Access to SEC filings. The most typical SEC filings are Form 10-K, Form 10-Q, Form 8-K,
;; the proxy statement, Forms 3, 4 and 5, Schedule 13, Form 114 and Foreign Investment Disclosures.

(defun sec-filings (&key ticker (limit 100) (type "10-K") (page 0))
  "Return SEC Filings for a company"
  (return-json-v3 (concatenate 'string "sec_filings/" ticker)
		  (pairlis '("page" "type" "limit") `(,page ,type ,limit))))

(defun sec-rss-feed ()
  "Real time SEC filings"
  (return-json-v3 "rss_feed" (pairlis '("page") '(0))))

