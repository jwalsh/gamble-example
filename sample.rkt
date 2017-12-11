#lang gamble

(define (count-heads n)
  (if (zero? n) 0 (+ (if (flip) 1 0) (count-heads (sub1 n)))))

(define (geom)
  (if (flip) 0 (add1 (geom))))
