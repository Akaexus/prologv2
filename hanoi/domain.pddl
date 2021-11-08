(define (domain hanoi)
	(:requirements :adl)
  (:types slot disk)
	(:predicates
		(on ?disk - disk ?slot - slot)
    (lt ?a - disk ?b - disk) ; a < b
    (less ?x ?y - disk)
    (najmniejszy ?disk - disk ?slot - slot)
	)

  (:derived (najmniejszy ?disk - disk ?slot - slot)
    (and
      (on ?disk ?slot)
      (not
        (exists (?z - disk)
          (and
            (on ?z ?slot)
            (less ?z ?disk)
          )
        )
      )
    )
  )

  (:action przesun-na-pusty
    :parameters(?source - slot ?destination - slot ?disk - disk)
    :precondition
    (and
      ; dysk na source badylu
      (on ?disk ?source)
      ; destination puste
      (not
        (exists (?z - disk)
          (on ?z ?destination)
        )
      )
      ; najmniejszy na source
      (najmniejszy ?disk ?source)
    )
    :effect (
      and
          (not(on ?disk ?source))
          (on ?disk ?destination)
    )
  )

  (:action przesun
    :parameters(
      ?source - slot
      ?destination - slot
      ?disk - disk
      ?minDestDisk - disk
    )
    :precondition
    (and
      ; destination puste
      (najmniejszy ?disk ?source)
      (najmniejszy ?minDestDisk ?destination)
      (less ?disk ?minDestDisk)
    )
    :effect (
      and
          (not(on ?disk ?source))
          (on ?disk ?destination)
    )
  )


  (:derived (less ?x ?y - disk)
    (or
      (lt ?x ?y)
      (exists (?z - disk) (and (lt ?x ?z) (less ?z ?y))) ; rekurencja
    )
  )



)
