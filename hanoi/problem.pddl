(define (problem hanoi)
  (:domain hanoi)
  (:objects
  	x y z - slot
  	k1 k2 k3 k4 k5 - disk
  )
  (:init
    (lt k1 k2)
    (lt k2 k3)
    (lt k3 k4)
    (lt k4 k5)
  	(on k5 x)
  	(on k4 x)
  	(on k3 x)
  	(on k2 x)
  	(on k1 x)
  )
  (:goal
  	(and
	    (on k5 z)
  		(on k4 z)
  		(on k3 z)
  		(on k2 z)
  		(on k1 z)
  	)
  )
)
