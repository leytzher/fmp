;;;; fmp.asd

(asdf:defsystem #:fmp
  :description "FMP + Common Lisp"
  :author "leytzher"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:dexador :cl-json :alexandria :serapeum :cl-dotenv :websocket-driver-client :wilbur)
  :components ((:file "package")
	       (:file "settings")
	       (:file "utils")
	       (:file "url-methods")
               (:file "general")
	       (:file "fundamentals")
	       (:file "fundamental-analysis")
	       (:file "insider-trading")
	       (:file "sec-filings")
	       (:file "earnings-calendar")
	       (:file "important-events")
	       (:file "cik")
	       (:file "price-target")
	       (:file "symbol-list")
               (:file "prices")
	       (:file "returns")
	       (:file "company")
               (:file "fmp")))
