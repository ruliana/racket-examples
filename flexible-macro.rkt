#lang racket/base

(require (for-syntax racket/base
                     syntax/parse)
         racket/match)

(module+ test (require rackunit
                       racket/list))

(provide given)

; "define" replacement for variable assignment
(define-syntax (given stx)
  (syntax-parse stx #:literals (values)
    [(_) #'(void)]
    [(_ (values binds:id ...) exp:expr rest ...)
     #'(begin (define-values (binds ...) exp) (given rest ...))]
    [(_ (type binds:id ...) exp:expr rest ...)
     #'(begin (match-define (type binds ...) exp) (given rest ...))]
    [(_ bind:id exp:expr rest ...)
     #'(begin (define bind exp) (given rest ...))]))

(module+ test
  (test-begin
   (given a 1)
   (check = a 1))
  (test-begin
   (given a 1 b 2)
   (check = a 1)
   (check = b 2))
  (test-begin
   (given (values a b) (partition even? '(1 2 3 4))
          c 3)
   (check equal? a '(2 4))
   (check equal? b '(1 3))
   (check = c 3))
  (test-begin
   (given (list a ... b) '(1 2 3))
   (check equal? a '(1 2))
   (check = b 3))
  (test-begin
   (struct something (f1 f2) #:transparent)
   (given (something a b) (something 1 2))
   (check = a 1)
   (check = b 2)))
