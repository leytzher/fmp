(in-package :fmp)

(defun quotes (exchange)
  "Query FMP /quotes/ API. Available exchanges are: 
  etf, commodity, euronext, nyse, amex, tsx, index, mutual_fund, nasdaq, xetra, nse, lse
  forex, crypto"
  (if (member exchange *exchange-list* :test #'string=)
      (return-json-v3 (concatenate 'string "quotes/" exchange))
      (format t "Invalid asset. Must be one of ~a:" *exchange-list*)))

(defun multi-quote (list-of-tickers)
  "Multiple company prices. Pass tickers as a list"
  (return-json-v3 (concatenate 'string "quote/" (string-join list-of-tickers ","))))

(defun tradable-symbols ()
  "return a list of all tradable symbols and its last price"
  (return-json-v3 "available-traded/list"))

(defun etf-list ()
  "return a list of all  etf and its last price"
  (return-json-v3 "etf/list"))

(defun stock-list ()
  "return a list of all stocks and its last price"
  (return-json-v3 "stock/list"))

(defun search-ticker (&key ticker exchange (limit 10))
  "Search via ticker"
  (cond ((member (string-downcase exchange) *exchange-list* :test #'string=)
	 (let ((params (pairlis '("query" "exchange" "limit") `(,ticker ,(string-upcase exchange) ,limit))))
	   (return-json-v3 "search-ticker" :query-vals params)))
	(t (format t "Invalid Exchange. Values must be one of: ~a" *exchange-list*))))

(defun search? (&key ticker exchange (limit 10))
  "Search via ticker and exchange"
  (cond ((member (string-downcase exchange) *exchange-list* :test #'string=)
	 (let ((params (pairlis '("query" "exchange" "limit") `(,ticker ,(string-upcase exchange) ,limit))))
	   (return-json-v3 "search" :query-vals params)))
	(t (format t "Invalid Exchange. Values must be one of: ~a" *exchange-list*))))

(defun search-name (&key name exchange (limit 10))
  "Search via name and exchange"
  (cond ((member (string-downcase exchange) *exchange-list* :test #'string=)
	 (let ((params (pairlis '("query" "exchange" "limit") `(,name ,(string-upcase exchange) ,limit))))
	   (return-json-v3 "search-name" :query-vals params)))
	(t (format t "Invalid Exchange. Values must be one of: ~a" *exchange-list*))))

(defun sp500-companies ()
  "All S&P 500 constituents"
  (return-json-v3 "sp500_constituent")))

(defun nq100-companies ()
"All Nasdaq 100 companies"
    (return-json-v3 "nasdaq_constituent"))

(defun dow-companies ()
    "All Dow Jones companies"
    (return-json-v3 "dowjones_constituent"))


