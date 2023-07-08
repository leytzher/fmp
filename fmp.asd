;;;; fmp.asd

(asdf:defsystem #:fmp
  :description "FMP + Common Lisp"
  :author "leytzher"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on (:dexador :cl-json :alexandria :serapeum :cl-dotenv :websocket-driver-client)
  :components ((:file "package")
	       (:file "settings")
	       (:file "utils")
	       (:file "url-methods")
               (:file "general")
	       ;;(:file "websockets")
               (:file "fmp")))
