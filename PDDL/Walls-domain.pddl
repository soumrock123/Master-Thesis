(define (domain walls)
  (:requirements :strips :equality :typing :action-costs)
  (:types 	block - object
		count - object
  )

  (:constants stone - block
	      wood - block
	      brick - block
	      iron-door - block
	      glass-pane - block
	      grass - block)

(:predicates 
	(block-at ?b - block ?x ?y ?z - count)
        (adjacent ?x1 ?x - count)
)

(:functions 
	(block-at-inventory ?b - block) - number
	(total-cost) - number
)


(:action build-block-empty
  :parameters (?x ?y ?z ?x1 - count ?b - block ?c - block)
  :precondition (and (>= (block-at-inventory ?b) 1) 
	(or
	(and (block-at ?b ?x1 ?y ?z) (adjacent ?x1 ?x))  
     	(and (block-at ?b ?x ?x1 ?z) (adjacent ?x1 ?y)) 
      	(and (block-at ?b ?x ?y ?x1) (adjacent ?x1 ?z))
	(and (block-at ?c ?x1 ?y ?z) (adjacent ?x1 ?x))  
     	(and (block-at ?c ?x ?x1 ?z) (adjacent ?x1 ?y)) 
      	(and (block-at ?c ?x ?y ?x1) (adjacent ?x1 ?z))
      	))
  :effect (and (block-at ?b ?x ?y ?z) (increase (total-cost) 1) (decrease (block-at-inventory ?b) 1))
)


(:action build-block-different
  :parameters (?x ?y ?z ?x1 - count ?a ?b ?c - block)
  :precondition (and (block-at ?a ?x ?y ?z) (>= (block-at-inventory ?b) 1) 
	(or
	(and (block-at ?a ?x1 ?y ?z) (adjacent ?x1 ?x))  
     	(and (block-at ?a ?x ?x1 ?z) (adjacent ?x1 ?y)) 
      	(and (block-at ?a ?x ?y ?x1) (adjacent ?x1 ?z))
	(and (block-at ?b ?x1 ?y ?z) (adjacent ?x1 ?x))  
     	(and (block-at ?b ?x ?x1 ?z) (adjacent ?x1 ?y)) 
      	(and (block-at ?b ?x ?y ?x1) (adjacent ?x1 ?z))
	(and (block-at ?c ?x1 ?y ?z) (adjacent ?x1 ?x))  
     	(and (block-at ?c ?x ?x1 ?z) (adjacent ?x1 ?y)) 
      	(and (block-at ?c ?x ?y ?x1) (adjacent ?x1 ?z))
      	))
  :effect (and (block-at ?b ?x ?y ?z) (not (block-at ?a ?x ?y ?z)) (increase (total-cost) 1) 
	  (decrease (block-at-inventory ?b) 1))
)
	

(:action mine-block
  :parameters (?x ?y ?z - count ?a - block)
  :precondition (block-at ?a ?x ?y ?z)
  :effect (and (not (block-at ?a ?x ?y ?z)) (increase (total-cost) 1))
)

)
