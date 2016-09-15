#lang reader "reader-macro-glue.rkt"

(define a/b "no-conflict")

(regexp-match /1(\d+)3/ "123") ; \o/ My own regexp literal!
