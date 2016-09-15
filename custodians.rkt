#lang racket
(define (do-work a-function)
  (define cust (make-custodian))
  (define (start) (displayln "->"))
  (define (finish)
    (displayln "<-")
    (custodian-shutdown-all cust))
  (parameterize ([current-custodian cust])
    (dynamic-wind
     start
     a-function
     finish)))

(let/cc return
  (define (fire)
     (displayln "fire!")
     (return)
     (displayln "unfire!"))
  (do-work fire))

(define (open-and-forget)
  (define out (open-output-file
               "/tmp/test.txt"
               #:exists 'truncate))
  (displayln "writing!")
  (writeln "can I write?" out))

(open-and-forget)

;(do-work open-and-forget)