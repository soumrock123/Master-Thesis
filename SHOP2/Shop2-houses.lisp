(defdomain basic-house (




; Operators


	(:operator (!place-block ?block-type ?x ?y ?z)
		   ((clear ?x ?y ?z))
                   ((clear ?x ?y ?z))
                   ((block-at ?block-type ?x ?y ?z)))


	(:operator (!mine ?block-type ?x ?y ?z)
		   ((block-at ?block-type ?x ?y ?z))
		   ((block-at ?block-type ?x ?y ?z))
		   ((clear ?x ?y ?z)))


	(:operator (!place-door ?door-type ?x ?y ?z)
		   ((up ?y1 ?y) (clear ?x ?y ?z) (clear ?x ?y1 ?z))
                   ((clear ?x ?y ?z) (clear ?x ?y1 ?z))
                   ((block-at ?door-type ?x ?y ?z) (block-at ?door-type ?x ?y1 ?z)))




; Methods




        (:method (build-block ?x ?y ?z ?b)
           	block-is-empty
           	((clear ?x ?y ?z) (block-placeable ?x ?y ?z))
           	((:task !place-block ?b ?x ?y ?z))

           	block-is-same
           	((block-at ?b ?x ?y ?z))
           	()

		block-is-different
           	((block-at ?a ?x ?y ?z))
           	(:ordered 
			(:task !mine ?a ?x ?y ?z)
			(:task !place-block ?b ?x ?y ?z)))



	
	
        (:method (build-door ?x ?y ?z ?door)
           	door-is-empty
           	((up ?y1 ?y) (clear ?x ?y ?z) (clear ?x ?y1 ?z) (block-placeable ?x ?y ?z) (block-placeable ?x ?y1 ?z))
           	((:task !place-door ?door ?x ?y ?z))

           	door-is-same
           	((block-at ?door ?x ?y ?z) (block-at ?door ?x ?y1 ?z))
           	()

		door-is-different
           	((block-at ?a ?x ?y ?z) (block-at ?c ?x ?y1 ?z))
           	(:ordered 
			(:task !mine ?a ?x ?y ?z)
			(:task !mine ?c ?x ?y1 ?z)
			(:task !place-door ?door ?x ?y ?z)))






        (:method (build-stack ?x1 ?y ?z1 ?b ?i)
           	0-stack
           	((stack-height ?i) (call = ?i 0))
           	()

           	1-stack
           	((call = ?i 1) 
		(up ?y1 ?y) (right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 1))
           	((:task build-block ?x1 ?y ?z1 ?b))

		2-stack
           	((call = ?i 2) 
		(up ?y1 ?y) (up ?y2 ?y1) (right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 2))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task build-block ?x1 ?y1 ?z1 ?b))
		
		3-stack
           	((call = ?i 3)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 3))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task build-block ?x1 ?y1 ?z1 ?b)
			(:task build-block ?x1 ?y2 ?z1 ?b))

		4-stack
           	((call = ?i 4)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) 
		(right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 4))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task build-block ?x1 ?y1 ?z1 ?b)
			(:task build-block ?x1 ?y2 ?z1 ?b)
			(:task build-block ?x1 ?y3 ?z1 ?b))

		5-stack
           	((call = ?i 5)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) 
		(right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 5))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task build-block ?x1 ?y1 ?z1 ?b)
			(:task build-block ?x1 ?y2 ?z1 ?b)
			(:task build-block ?x1 ?y3 ?z1 ?b)
			(:task build-block ?x1 ?y4 ?z1 ?b)))
	
	





        (:method (build-stack-door ?x1 ?y ?z1 ?b ?d ?i)
		3-stack-door
           	((call = ?i 3)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 3)
		(block-at-inventory ?d ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-door ?x1 ?y ?z1 ?d)
			(:task build-block ?x1 ?y2 ?z1 ?b))

		4-stack-door
           	((call = ?i 4)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) 
		(right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 4)
		(block-at-inventory ?d ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-door ?x1 ?y ?z1 ?d)
			(:task build-block ?x1 ?y2 ?z1 ?b)
			(:task build-block ?x1 ?y3 ?z1 ?b))

		5-stack-door
           	((call = ?i 5)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) 
		(right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 5)
		(block-at-inventory ?d ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-door ?x1 ?y ?z1 ?d)
			(:task build-block ?x1 ?y2 ?z1 ?b)
			(:task build-block ?x1 ?y3 ?z1 ?b)
			(:task build-block ?x1 ?y4 ?z1 ?b)))






 	(:method (build-stack-window ?x1 ?y ?z1 ?b ?w ?i)
		3-stack-window
           	((call = ?i 3)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 3)
		(block-at-inventory ?w ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task build-block ?x1 ?y1 ?z1 ?w)
			(:task build-block ?x1 ?y2 ?z1 ?b))

		4-stack-window
           	((call = ?i 4)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) 
		(right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 4)
		(block-at-inventory ?w ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task build-block ?x1 ?y1 ?z1 ?b)
			(:task build-block ?x1 ?y2 ?z1 ?w)
			(:task build-block ?x1 ?y3 ?z1 ?b))

		5-stack-window
           	((call = ?i 5)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) 
		(right ?x1 ?x) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 5)
		(block-at-inventory ?w ?m) (call >= ?m 1))
           	(:ordered
			(:task build-block ?x1 ?y ?z1 ?b) 
			(:task build-block ?x1 ?y1 ?z1 ?b)
			(:task build-block ?x1 ?y2 ?z1 ?w)
			(:task build-block ?x1 ?y3 ?z1 ?b)
			(:task build-block ?x1 ?y4 ?z1 ?b)))





	  (:method (build-wall-door ?x1 ?y ?z1 ?b ?d ?i)
		3-wall-door
           	((call = ?i 3)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (right ?x1 ?x) (right ?x2 ?x1) 
		(right ?x3 ?x2) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 9)
		(block-at-inventory ?d ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-stack ?x1 ?y ?z1 ?b ?i)
			(:task build-stack-door ?x2 ?y ?z1 ?b ?d ?i)
			(:task build-stack ?x3 ?y ?z1 ?b ?i))

		4-wall-door
           	((call = ?i 4)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (right ?x1 ?x) 
		(right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 16)
		(block-at-inventory ?d ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-stack ?x1 ?y ?z1 ?b ?i)
			(:task build-stack-door ?x2 ?y ?z1 ?b ?d ?i)
			(:task build-stack ?x3 ?y ?z1 ?b ?i)
			(:task build-stack ?x4 ?y ?z1 ?b ?i))
		
		5-wall-door
           	((call = ?i 5)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) (right ?x1 ?x) 
		(right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3) (right ?x5 ?x4) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 25)
		(block-at-inventory ?d ?m) (call >= ?m 1))
           	(:ordered 
			(:task build-stack ?x1 ?y ?z1 ?b ?i)
			(:task build-stack ?x2 ?y ?z1 ?b ?i)
			(:task build-stack-door ?x3 ?y ?z1 ?b ?d ?i)
			(:task build-stack ?x4 ?y ?z1 ?b ?i)
			(:task build-stack ?x5 ?y ?z1 ?b ?i)))




	(:method (build-house ?x1 ?y ?z1 ?b ?d ?w ?i)
		3x3-house
           	((call = ?i 3) (at ?player ?x ?y ?z)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (right ?x1 ?x) (right ?x2 ?x1) 
		(right ?x3 ?x2) (front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2)
		(block-at-inventory ?b ?n) (call >= ?n 35)
		(block-at-inventory ?d ?m) (call >= ?m 1)
		(block-at-inventory ?w ?o) (call >= ?o 5))
           	(:ordered 
			(:task build-wall-door ?x1 ?y ?z1 ?b ?d ?i)
			(:task build-stack-window ?x1 ?y ?z2 ?b ?w ?i)
			(:task build-stack ?x1 ?y ?z3 ?b ?i)
			(:task build-stack-window ?x2 ?y ?z3 ?b ?w ?i)
			(:task build-stack ?x3 ?y ?z3 ?b ?i)
			(:task build-stack-window ?x3 ?y ?z2 ?b ?w ?i))

		4x4-house
           	((call = ?i 4) (at ?player ?x ?y ?z)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (right ?x1 ?x) 
		(right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3) (front ?z1 ?z)
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3)
		(block-at-inventory ?b ?n) (call >= ?n 16)
		(block-at-inventory ?d ?m) (call >= ?m 2)
		(block-at-inventory ?w ?o) (call >= ?o 8))
           	(:ordered 
			(:task build-wall-door ?x1 ?y ?z1 ?b ?d ?i)
			(:task build-stack-window ?x1 ?y ?z2 ?b ?w ?i)
			(:task build-stack-window ?x1 ?y ?z3 ?b ?w ?i)
			(:task build-stack ?x1 ?y ?z4 ?b ?i)
			(:task build-stack-window ?x2 ?y ?z4 ?b ?w ?i)
			(:task build-stack-window ?x3 ?y ?z4 ?b ?w ?i)			
			(:task build-stack ?x4 ?y ?z4 ?b ?i)
			(:task build-stack-window ?x4 ?y ?z3 ?b ?w ?i)
			(:task build-stack-window ?x4 ?y ?z2 ?b ?w ?i))
		
		5x5-house
           	((call = ?i 5) (at ?player ?x ?y ?z)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) (right ?x1 ?x) 
		(right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3) (right ?x5 ?x4) (front ?z1 ?z)
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4)
		(block-at-inventory ?b ?n) (call >= ?n 25)
		(block-at-inventory ?d ?m) (call >= ?m 2)
		(block-at-inventory ?w ?o) (call >= ?o 8))
           	(:ordered 
			(:task build-wall-door ?x1 ?y ?z1 ?b ?d ?i)
			(:task build-stack ?x1 ?y ?z2 ?b ?i)
			(:task build-stack-window ?x1 ?y ?z3 ?b ?w ?i)
			(:task build-stack ?x1 ?y ?z4 ?b ?i)
			(:task build-stack ?x1 ?y ?z5 ?b ?i)
			(:task build-stack ?x2 ?y ?z5 ?b ?i)
			(:task build-stack-window ?x3 ?y ?z5 ?b ?w ?i)			
			(:task build-stack ?x4 ?y ?z5 ?b ?i)
			(:task build-stack ?x5 ?y ?z5 ?b ?i)
			(:task build-stack ?x5 ?y ?z4 ?b ?i)
			(:task build-stack-window ?x5 ?y ?z3 ?b ?w ?i)
			(:task build-stack ?x5 ?y ?z2 ?b ?i)))


; State axioms

        (:- (clear ?x ?y ?z)
	    ((not (block-at ?block-type ?x ?y ?z))))


	 (:- (block-placeable ?x ?y ?z)
	 	right	((right ?x1 ?x) (block-at ?block-type ?x1 ?y ?z))
	 	left	((right ?x ?x-1) (block-at ?block-type ?x-1 ?y ?z))
	 	up	((up ?y1 ?y) (block-at ?block-type ?x ?y1 ?z))
	 	down	((up ?y ?y-1) (block-at ?block-type ?x ?y-1 ?z))
	 	front	((front ?z1 ?z) (block-at ?block-type ?x ?y ?z1))
	 	back	((front ?z ?z-1) (block-at ?block-type ?x ?y ?z-1)))))




(defproblem houses basic-house

	((at player 0 0 0)
	(block-at-inventory brick 1300)
	(block-at-inventory iron-door 30)
	(block-at-inventory glass-pane 100)
	(right 0 -1)
	(right 1 0)
	(right 2 1)
	(right 3 2)
	(right 4 3)
	(right 5 4)
	(front 1 0)
	(front 0 -1)
	(front 2 1)
	(front 3 2)
	(front 4 3)
	(front 5 4)
	(up 1 0)
	(up 0 -1)
	(up 2 1)
	(up 3 2)
	(up 4 3)
	(up 5 4)
	(block-at grass 1 -1 1)
	(block-at wood 5 4 3) 
	(block-at wood 5 0 4) 
	(block-at wood 5 3 4)
	(block-at wood 5 4 4)
       )

	((build-house 1 0 1 brick iron-door glass-pane 5)))
	

(shop-trace :methods :operators)
(find-plans 'houses :verbose :plans)


	
		


