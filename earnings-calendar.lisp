(in-package :fmp)

;; Each publicly traded company should release its Earning Reports 4 times a year. The report consists of 3 financial statements:
;; Balance sheet, income sheet and cash flow
;; There is no defined date when each company should report its earning, the only rule is to report earnings up to 45 days from the end of
;; each quarter. The start date of a company fiscal year may vary, so release dates are different for companies.

;; An Earning calendar is a list of the companies' report release dates.

(defun earnings-calendar (&key ticker)
  (return-json-v3 (concatenate 'string "historical/earning_calendar/" ticker)))

(defun earning-surprises (&key ticker)
  (return-json-v3 (concatenate 'string "earnings-surprises/" ticker)))
