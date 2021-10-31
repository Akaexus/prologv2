(define
	(domain world-of-blocks)
	(:requirements :adl)
	(:predicates
		(on-top ?up ?down)
		(on-floor ?x)
		(clear ?x)
		(holding ?x)
	)
	
	
	;(:derived (is_root_of ?top ?bottom)
	;(or
	;		(and
	;			(on-floor ?bottom)
	;			(= ?top ?bottom)
	;		)
	;		(and
	;			(not(= ?top ?bottom))
	;			(
	;				exists (?lower) (
	;					(and
	;						(on-top ?top ?lower)
	;						(is_root_of ?lower ?bottom)
	;					)
	;				)
	;			)
	;		)
	;	)
	;)
 
	(:action podnies-z-podlogi
		:parameters(?x)
		:precondition
		(and
			(not(exists (?e) (holding ?e)))
			(clear ?x)
			(on-floor ?x)
		)
		:effect
		(and
			(holding ?x)
			(not(clear ?x))
			(not(on-floor ?x))
		)
	)
 
	(:action podnies-z-paczki
		:parameters(?up ?down)
		:precondition
		(and
			(not(exists (?e) (holding ?e)))
			(clear ?up)
			(on-top ?up ?down)
		)
		:effect
		(and
			(holding ?up)
			(clear ?down)
			(not(clear ?up))
			(not(on-top ?down ?up))
		)
	)
 
 	; x - nizej, z - wyzej
	(:action opusc-na-podloge
		:parameters (?x)
		:precondition
		(and
			(holding ?x)
		)
		:effect
		(and
			(on-floor ?x)
			(clear ?x)
			(not(holding ?x))
		)
	)
 
	; x - nizej, z - wyzej
	(:action opusc
		:parameters (?down ?up)
		:precondition
		(and
			(clear ?down)
			(holding ?up)
		)
		:effect
		(and
			(clear ?up)
			(on-top ?up ?down)
			(not (clear ?down))
			(not(holding ?up))
		)
	)
	
	; przesuń paczkę na podłogę
	;(:action move-to-floor
	;	:parameters (?x ?z)
	;	:precondition
	;	(and
	;		(clear ?x)
	;		(on-top ?x ?z)
	;	)
	;	:effect
	;	(and
	;		(not (on-top ?x ?z))
	;		(on-floor ?x)
	;		(clear ?z)
	;	)
	;)
	; przesuń paczkę na inną paczkę
	;(:action move-to-block
	;	:parameters (?x ?y)
	;	:precondition
	;	(and
	;		(clear ?x)
	;		(clear ?y)
    ;                    (on-floor ?x)
	;	)
	;	:effect
	;	(and
	;		(on-top ?x ?y)
	;		(not (clear ?y))
	;		(not (on-floor ?x))
	;	)
	;)
)
