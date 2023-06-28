(in-package :fmp)

(defun quotes (symbols)
  "Query FMP /quotes/ API
  symbols are comma separated ticker(s), index(es), commodity(ies), etc"
  (let ((path (concatenate 'string "quotes/" symbols)))
    (return-json-v3 path)))

