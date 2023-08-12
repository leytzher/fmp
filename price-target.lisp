(in-package :fmp)

(defun price-target (&key ticker)
  "Price target for ticker"
  (return-json-v4 "price-target" `(("symbol" . ,ticker))))


(defun price-target-summary (&key ticker)
  (return-json-v4 "price-target-summary" `(("symbol" . ,ticker))))

(defun price-target-by-analyst-name (&key analyst-name)
  (return-json-v4 "price-target-analyst-name" `(("name" . ,(format-query-string analyst-name)))))

(defun price-target-by-analyst-company (&key company)
  (return-json-v4 "price-target-analyst-company" `(("company" . ,(format-query-string company)))))

(defun price-target-consensus (&key ticker)
  (return-json-v4 "price-target-consensus" `(("symbol" . ,ticker))))


(defun price-target-rss-feed (&key (page 0))
  (return-json-v4 "price-target-rss-feed" `(("page" . ,page))))

