(define
	(domain sokoban)
	(:requirements :adl)
	(:predicates
		(poziomo ?a ?b)
		(pionowo ?a ?b)
		(paczka ?x)
		(robot ?x)
		(cel ?x)

	)

 
	(:action idz
		:parameters(?from ?to)
		:precondition
		(and
			(or
				(poziomo ?from ?to)
				(pionowo ?from ?to)
			)
			(robot ?from)
			(not
				(paczka ?to)
			)
		)
		:effect
		(and
			(not (robot ?from))
			(robot ?to)
		)
	)
	(:action pchaj
		:parameters(?from ?to ?next)
		:precondition
		(and
			(or
				(and
					(poziomo ?from ?to)
					(poziomo ?to ?next)
				)
				(and
					(pionowo ?from ?to)
					(pionowo ?to ?next)
				)
			)
			(robot ?from)
			(paczka ?to)
			(not (paczka ?next))
			(not
				(= ?from ?next)
			)
		)
		:effect
		(and
			(not (paczka ?to))
			(paczka ?next)
			(not (robot ?from))
			(robot ?to)
		)
	)
)
