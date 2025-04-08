(defsystem "hello-commonlisp-test"
    :version "0.1.0"
    :author "haruki7049"
    :license "MIT"
    :depends-on ("hello-commonlisp"
                 "fiveam")
    :components ((:module "test"
                          :components
                          ((:file "main"))))
    :description "The hobby commonlisp project for my practice")
