(in-package :fmp)

(defparameter *ws-url* "wss://websockets.financialmodelingprep.com")

(defparameter *login-event* nil)

(setf *login-event*
      (let ((key (pairlis '("apiKey") `(,*api-key*))))
	(pairlis '("event" "data") `("login" ,key))))

(defun subscribe-ticker (ticker)
  (pairlis '("event" "data") `("subscribe" ,(pairlis '("ticker") `(,ticker)))))

(defparameter *client* (wsd:make-client *ws-url*))

(wsd:start-connection *client*)

(wsd:on :message *client*
	(lambda (message)
	  (format t "~a" (cl-json:decode-json-from-string message))))

(wsd:send *client* (cl-json:encode-json *login-event*))

(wsd:send *client* (cl-json:encode-json (subscribe-ticker "aapl")))

(wsd:close-connection *client*)




