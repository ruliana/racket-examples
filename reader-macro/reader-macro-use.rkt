#lang reader "reader-macro-glue.rkt"

; \o/ My own regexp literal!
(for-each displayln
          (list
           (regexp-match #px"1(\\d+)3" "123")
           (regexp-match    /1(\d+)3/  "123")
           /abc/
           #px"abc"))
