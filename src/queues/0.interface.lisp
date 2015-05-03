(defpackage :eazy-a-star.queue
  (:use :cl :ea*.b :structure-interface)
  (:nicknames :ea*.q))
(in-package :ea*.q)

(define-interface queue-interface (queue)
  ((init        `(function (&rest t) ,queue) :external t)
   (enqueue     `(function (,queue priority node) ,queue))
   (dequeue     `(function (,queue) (values (or node null) boolean)))
   (delete-node `(function (,queue priority node) (values ,queue boolean)))
   (delete-id   `(function (,queue priority id) (values ,queue boolean))))
  :export t
  :documentation "Interface for priority queues")
