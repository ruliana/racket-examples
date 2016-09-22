#lang racket

; === Boilerplate code
(provide (rename-out [regexp-read read]
                     [regexp-read-syntax read-syntax]))

(define (regexp-read in)
  (parameterize ([current-readtable (regexp-readtable)])
    (read in)))

(define (regexp-read-syntax src in)
  (parameterize ([current-readtable (regexp-readtable)])
    (read-syntax src in)))

(define (regexp-readtable)
  (define reader
    (case-lambda
      [(ch in) (syntax->datum (parse-expr #f in))]
      [(ch in src line col pos) (parse-expr src in)]))
  (make-readtable (current-readtable)
                  #\/ 'non-terminating-macro reader))

; === Code that matters

(define (parse-expr src in)
  (define expr-match
    (regexp-match #px"^(.*?)\\/" in))
  (define rx
    (bytes->string/utf-8 (second expr-match)))
  (datum->syntax #f `(pregexp ,rx)))
