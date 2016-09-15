#lang s-exp syntax/module-reader
racket
#:read regexp-read
#:read-syntax regexp-read-syntax

(require (prefix-in regexp- "reader-macro.rkt"))
