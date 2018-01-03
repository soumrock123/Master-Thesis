(define (domain walls)
  (:requirements :strips :equality :typing :action-costs)
  (:types 	block - object
		count - object
  )

  (:constants oak-wood - block
	      spruce-wood-plank - block
	      spruce-wood-slab - block
	      spruce-wood-stair - block
	      brick - block
	      oak-wood-plank - block
	      oak-door - block
	      glass-pane - block
	      oak-wood-stair - block
	      oak-leaf - block
	      oak-fence - block
	      torch - block
	      wooden-pressure-plate - block
	      grass - block)

(:predicates 
	(block-at ?b - block ?x ?y ?z - count)
        (right ?x1 ?x - count)
	(up ?y1 ?y - count)
	(front ?z1 ?z - count)
)

(:functions 
	(block-at-inventory ?b - block) - number
	(total-cost) - number
)

(:action build-block-empty
  :parameters (?x - count ?y - count ?z - count ?b - block)
  :precondition (>= (block-at-inventory ?b) 1)
  :effect (and (block-at ?b ?x ?y ?z) (increase (total-cost) 1) (decrease (block-at-inventory ?b) 1))
)


(:action build-block-different
  :parameters (?x - count ?y - count ?z - count ?a - block ?b - block)
  :precondition (and (block-at ?a ?x ?y ?z) (>= (block-at-inventory ?b) 1))
  :effect (and (block-at ?b ?x ?y ?z) (not (block-at ?a ?x ?y ?z)) (increase (total-cost) 1) (decrease (block-at-inventory ?b) 1))
)


(:action mine-block
  :parameters (?x - count ?y - count ?z - count ?a - block)
  :precondition (block-at ?a ?x ?y ?z)
  :effect (and (not (block-at ?a ?x ?y ?z)) (increase (total-cost) 1))
)

)
