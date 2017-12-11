#lang gamble

(define (flip [n .5])
  (if (> (random) n)
      #t
      #f))

(flip)

(map flip (list .5 .5 .1 .1 .1 .1))

(unless (for/and ([i 10]) (flip 0.3))
  #t)

;; (define s-or2flips
;;   (rejection-sampler
;;    (define A (flip))
;;    (define B (flip))
;;    (or A B)))
