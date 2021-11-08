(define (domain merry)
	(:requirements :adl)
  (:types color ball room pivot)
	(:predicates
		(ballInRoom ?ball - ball ?room - room)
		(color ?ball - ball ?color - color)
		(door ?source - room ?destination - room ?color - color)
		(merry ?room - room)
		(stack ?ball - ball)
	)
	(:action wez
	  :parameters(?color - color ?ball - ball ?room - room)
	  :precondition (
	    and
	      (merry ?room)
	      (ballInRoom ?ball ?room)
	      (color ?ball ?color)
	  )
	  :effect(
	    and
	      (not(ballInRoom ?ball ?room))
	      (stack ?ball)
	  )
	)

	(:action idz
		:parameters (?destination - room ?source - room ?ball - ball ?color - color)
		:precondition (
			and
			(merry ?source)
			(door ?source ?destination ?color)
			(color ?ball ?color)
			(stack ?ball)
		)
		:effect (
			and
				(not(stack ?ball))
				(not(merry ?source))
				(merry ?destination)
		)
	)
)
