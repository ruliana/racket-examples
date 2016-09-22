#lang racket
(require racket/dict)
(require (for-syntax syntax/parse))

(provide (except-out (all-from-out racket) #%app)
         (rename-out [my-app #%app]))

(define-syntax (my-app stx)
  (syntax-parse stx
    [(_ proc arg) #'(if (dict? proc)
                             (dict-ref proc arg)
                             (#%app proc arg))]
    [(_ proc args ...) #'(#%app proc args ...)]))
