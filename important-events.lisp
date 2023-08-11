(in-package :fmp)

;; if a publicly traded company experiences a significatn event, it is usually required to file Form 8-K to notify the
;; public and SEC.


(defun important-events ()
  (return-json-v4 "rss_feed_8k" (pairlis '("page") '(0))))

