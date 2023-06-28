;;;; fmp.asd

(asdf:defsystem #:fmp
  :description "FMP + Common Lisp"
  :author "AlgoTraders"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:dexador :cl-json :alexandria :serapeum :cl-dotenv)
  :components ((:file "package")
	       (:file "settings")
	       (:file "url-methods")
               (:file "fmp")))
