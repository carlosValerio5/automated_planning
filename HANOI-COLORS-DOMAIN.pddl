;; Color-Restricted Towers of Hanoi - domain
(define (domain color-hanoi)
  (:requirements :strips :typing)
  (:types
    support ;; parent type of disc and peg
    disc - support
    peg - support
    color
  )
  (:predicates
    ;; Relations
    (on ?d - disc ?x - support)          ;; ?d is on top of ?x  (where ?x is either a disc or a peg)
    (clear ?x - support)                 ;; nothing is on top of ?x (disc or peg)
    (same-color ?x - disc ?y - disc)     ;; disc x and disc y have the same color
    (smaller ?d - disc ?e - disc)        ;; disc ?d is smaller than disc ?e
  )

  (:action move-to-peg
    :parameters (?d - disc ?from - support ?peg - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action move-onto-disc
    :parameters (?d - disc ?from - support ?top - disc)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?top)            
      (smaller ?d ?top)
      ;; color match
      (same-color ?d ?top)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?top)
      (not (clear ?top))
      (clear ?from)
    )
  )
)
