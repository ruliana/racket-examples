#lang racket

'(#reader"reader-macro.rkt" /12\d+3/)

(define x #reader"reader-macro.rkt" /12\d+3/)
