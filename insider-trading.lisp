(in-package :fmp)

;;; An insider is any director, officer or any person who owns more than 10% of a company.

(defun insider-trading (&key ticker (page 0))
  "Get insider trading for a symbol"
  (return-json-v4 "insider-trading"
		  (pairlis '("symbol" "page") `(,ticker ,page))))

