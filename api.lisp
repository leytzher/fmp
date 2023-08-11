;;; api.lisp
(in-package :fmp)

(defparameter *sp500-url* "https://www.slickcharts.com/sp500")

(defparameter *sp500-request* (dex:get *sp500-url*))

(defun sp500-weights ()
  (let* ((url "https://www.slickcharts.com/sp500")
	 (request (dex:get url))
	 (parsed-content (lquery:$ (lquery:initialize request)))
	 )))




