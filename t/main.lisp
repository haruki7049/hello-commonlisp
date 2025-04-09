(in-package :cl-user)
(defpackage hello-commonlisp.test
  (:use :cl :fiveam))
(in-package :hello-commonlisp.test)

(def-suite :foo)
(in-suite :foo)

(test foo-test
      (is (= 0 1)))
