#lang racket
(provide (except-out (all-from-out racket) #%app)
         (rename-out [my-app #%app]))

(define-syntax-rule (my-app proc args ...)
  (begin
    (displayln proc)
    (#%app proc args ...)))