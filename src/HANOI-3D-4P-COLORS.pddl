;; Problem file for Color-Restricted Towers of Hanoi
(define (problem color-hanoi-4)
  (:domain color-hanoi)

  (:objects
    ;; pegs
    pegA pegB pegC pegD - peg

    ;; discs (d1 = smallest, d2, d3, d4 = largest)
    d1 d2 d3 d4 - disc
  )

  ;; Initial state:
  ;; Stack on pegA (bottom -> top): d4 d3 d2 d1
  ;; Colors alternate: d4 red, d3 blue, d2 red, d1 blue
  (:init
    ;; positions
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegA)

    ;; which things are clear: top disc and empty pegs
    (clear d1)
    (clear pegB)
    (clear pegC)
    (clear pegD)
    ;; pegA is not listed clear because it has discs on it

    ;; colors
    (same-color d1 d3)
    (same-color d2 d4)
    (same-color d3 d1)
    (same-color d4 d2)
    (not (same-color d1 d2))
    (not (same-color d1 d4))
    (not (same-color d2 d1))
    (not (same-color d2 d3))
    (not (same-color d3 d2))
    (not (same-color d3 d4))
    (not (same-color d4 d1))
    (not (same-color d4 d3))

    ;; size relation: smaller X Y when X is strictly smaller than Y.
    ;; For 4 discs: d1 < d2 < d3 < d4
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)
  )

  ;; Goal: all discs stacked on pegC in the same order (d4 bottom ... d1 top)
  (:goal (and
    (on d1 d3)
    (on d3 pegB)
    (on d2 d4)
    (on d4 pegC)
  ))
)
