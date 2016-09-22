#lang racket
(require threading)

(~>> '(100 200 300 400)
     (map add1)
     (take _ 2))

(~> '(100 200 300 400)
    (map add1 _)
    (take 2))