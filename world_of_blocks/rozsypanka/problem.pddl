(define (problem p1)
	(:domain world-of-blocks)
	(:objects a b c d e f g)
	(:init
		(on-floor a)
		(clear a)
		(on-floor b)
		(clear b)
		(on-floor c)
		(clear c)
		(on-floor d)
		(clear d)
		(on-floor e)
		(clear e)
		(on-floor f)
		(clear f)
		(on-floor g)
		(clear g)
	)
	;;;; WSZYSCY NA ZIEMIE!
	;(:goal
	;	(and
	;		(forall (?x) (on-floor ?x))
	;	)
	;)
	
	; ROZSYPANKA 2
	;(:goal
	;	(
	;		(
	;			(exists (?a) (
	;				(and
	;					(on-floor ?a)
	;					(
	;						exists (?b) (
	;							(and
	;								(not(= ?a ?b))
	;								(on-floor ?b)
	;							)
	;						)
	;					)
	;				)
	;			)
	;		)
	;	)
	;)
	; ROZSYPANKA 1
(:goal
		(and
			(exists (?x)(and (on-floor ?x) (not (exists (?y) (and (not (= ?x ?y)) (on-floor ?y))))))
			(not (exists (?d) (holding ?d)))
		)
	)
)
