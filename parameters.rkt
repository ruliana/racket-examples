#lang racket
(define number-of-threads
  (make-parameter 2))

(define (work)
  ;work hard!
  (displayln (number-of-threads)))

; Displays 2
(work)

; Displays 42
(parameterize ([number-of-threads 42])
  (work))