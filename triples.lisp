;;; triples.lisp

;;; Add namespaces
(w:add-namespace "fin" "http://algotraders.es/schema#")

;;; Initialize empty database if it doesn't exist
(when (null w:*db*)
  (setf w:*db* (make-instance 'w:db)))

(defun create-node (prefix suffix)
  (let ((expr-as-string (format nil "!~A:~A" prefix suffix)))
    (with-input-from-string (s expr-as-string)
      (let ((node (read s)))
        (eval node)))))

(defun make-triple (subject predicate object)
  "Create triple"
  (make-instance 'w:triple
		 :subject subject
		 :predicate predicate
		 :object object))

(defgeneric create-triple (obj)
  (:documentation "Create a triple from data extracted from object"))
