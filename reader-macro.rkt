#lang racket
 
(provide read read-syntax)
 
(define (read in)
  (syntax->datum (read-syntax #f in)))

(define (read-syntax src in)
  (skip-whitespace in)
  (parse-expr src in))

(define (skip-whitespace in)
  (regexp-match #px"\\s*" in))

(define (parse-expr src in)
  (define expr-match
    (regexp-match #px"^(\\S)(.*)\\1([im])?" in))
  (displayln expr-match)
  (quasisyntax/loc src (pregexp #,(third expr-match))))
