#lang racket

(define-syntax-rule (given (bind expr) ...)
  (begin
    (define bind expr) ...))

(define (hello-no-macro b)
  (let ([a "Hello,"]
        [c "!"])
    (format "~a ~a~a" a b c)))

(define (hello-macro b)
  (given [a "Hello,"]
         [c "!"])
  (format "~a ~a~a" a b c))