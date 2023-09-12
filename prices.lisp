(in-package :fmp)

(defun historical-prices (&key ticker)
  (return-json-v3 (concatenate 'string "historical-price-full/" ticker)))

