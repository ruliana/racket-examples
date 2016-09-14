#lang racket
(require (for-syntax syntax/parse))

(define-syntax (given stx)
  (syntax-parse stx
    #:literals (=)
    [(_ bind = expr)
     #'(define bind expr)]
    [(_ bind = expr rest ...)
     #'(begin (define bind expr)
              (given rest ...))]))

(define (hello b)
  (given a = "Why"
         c = "???")
  (format "~a ~a~a" a b c))