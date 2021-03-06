#|
  This file is a part of eazy-a-star project.
  Copyright (c) 2013 guicho ()
|#
(in-package :cl-user)
(defpackage eazy-a-star-test-asd
  (:use :cl :asdf))
(in-package :eazy-a-star-test-asd)

(defsystem eazy-a-star-test
  :author "guicho"
  :license "LLGPL"
  :depends-on (:eazy-a-star
	       :fiveam
	       :vecto
	       :local-time)
  :components ((:module "t"
                :serial t
                :components
                ((:file :package)
                 (:file :model)
		 (:file :drawer)
		 (:file :core)
		 (:file :a-star)
                 (:file :regression-stack-exhanst)
                 (:module :8puzzle
                          :serial :t
                          :components
                          ((:file :model)
                           (:file :methods)
                           (:file :ops)
                           (:file :test))))))
  :perform (load-op :after (op c) 
		    (eval (read-from-string "(fiveam:run! :eazy-a-star)"))
		    (asdf:clear-system c)))
