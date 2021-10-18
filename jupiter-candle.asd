(defsystem "jupiter-candle"
  :version "0.1.0"
  :author "entropic games"
  :license ""
  :depends-on ("trivial-gamekit" "cl-bodge/physics" "cl-bodge/physics/2d")
  :components ((:module "src"
                :components
                ((:file "packages")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "JupiterCandle/tests"))))

(defsystem "jupiter-candle/tests"
  :author "entropic games"
  :license ""
  :depends-on ("jupiter-candle"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for JupiterCandle"
  :perform (test-op (op c) (symbol-call :rove :run c)))
