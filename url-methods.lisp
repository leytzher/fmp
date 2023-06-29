(in-package :fmp)

(defparameter *read-timeout* 30)
(defparameter *connect-timeout* 5)

(defun string-join (strings separator)
  "Concatenates a list of strings using the specified separator."
  (when strings
    (reduce (lambda (str1 str2) (concatenate 'string str1 separator str2))
            strings)))
    
(defun convert-to-query-params (param-list)
  "Adds = to a list of query params alist. This is needed later to build a query string"
  (mapcar (lambda (pair) (format nil "~A=~A" (car pair) (cdr pair))) param-list))

(defun construct-url (base-url param-list)
  "Takes a base url and a alist and returns a url and query string"
  (concatenate 'string base-url "?" (string-join (convert-to-query-params param-list) "&")))

(defun return-json-v4 (path &optional (query-vals nil))
  "Query URL for JSON response for v4 of FMP API. 
    path is the path after TDL of URL"
  (let* ((url (concatenate 'string *base-url-v4* path))
	 (keys `("apikey" . ,*api-key*))
	 (params (cons keys query-vals))
	 (request-url (construct-url url params))
	 (res (dex:get request-url
		       :want-stream t
		       :read-timeout *read-timeout*
		       :connect-timeout *connect-timeout*)))
    (cl-json:decode-json-from-source res)))

(defun return-json-v3 (path &optional (query-vals nil))
  "Query URL for JSON response for v3 of FMP API. 
    path is the path after TDL of URL"
  (let* ((url (concatenate 'string *base-url-v3* path))
	 (keys `("apikey" . ,*api-key*))
	 (params (cons keys query-vals))
	 (request-url (construct-url url params))
	 (res (dex:get request-url :want-stream t :read-timeout *read-timeout* :connect-timeout *connect-timeout*)))
    (cl-json:decode-json-from-source res)))


