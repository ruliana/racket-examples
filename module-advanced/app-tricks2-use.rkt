#lang s-exp "app-tricks2.rkt"

(define x (hash 'a 1
                'b 2
                'c 3))

(add1 2)
(x 'b)
(x 'd)

