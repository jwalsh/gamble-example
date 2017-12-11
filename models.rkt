#lang gamble


(require plot)

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

;; 1.1
(define s-first-given-or
  (rejection-sampler
   (define A (flip))
   (define B (flip))
   (observe/fail (or A B))
   A))

(s-first-given-or)


(sampler->mean+variance s-first-given-or 100 (indicator #t))

(sampler->discrete-dist s-first-given-or 100)
(discrete-dist [#f 0.32] [#t 0.68])


;; (hist (repeat s-first-given-or 100))


;; 1.2
(define (count-true-flips n)
    (if (zero? n)
        0
        (+ (if (flip) 1 0)
           (count-true-flips (sub1 n)))))

(count-true-flips 100)
