

(defdomain creative (


; Axioms
	
	




; Operators


	(:operator (!place-block ?block-type ?x ?y ?z)
		   ((clear ?x ?y ?z))
                   ((clear ?x ?y ?z))
                   ((block-at ?block-type ?x ?y ?z)))


	(:operator (!mine ?block-type ?x ?y ?z)
		   ((block-at ?block-type ?x ?y ?z))
		   ((block-at ?block-type ?x ?y ?z))
		   ((clear ?x ?y ?z)))


	(:operator (!decrement ?i)
		   (not (call = ?i 0))
		   ()
		   ((assign ?i (decf '?i))))




; Methods




        (:method (build-block ?x ?y ?z ?b)
           	block-is-empty
           	((clear ?x ?y ?z))
           	((:task !place-block ?b ?x ?y ?z))

           	block-is-same
           	((block-at ?b ?x ?y ?z))
           	()

		block-is-different
           	((block-at ?a ?x ?y ?z))
           	(:ordered 
			(:task !mine ?a ?x ?y ?z)
			(:task !place-block ?b ?x ?y ?z)))






        (:method (build-stack ?x1 ?y ?z1 ?b ?i)
           	0-stack
           	((call = ?i 0))
           	()

		i-stack
           	((call <= ?i 10)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) (up ?y6 ?y5) (up ?y7 ?y6) 
		(up ?y8 ?y7) (up ?y9 ?y8) (up ?y10 ?y9) (right ?x1 ?x) (front ?z1 ?z)
	        (block-at-inventory ?b ?n) (call >= ?n 10))
           	(:ordered 
			(:task build-block ?x1 ?y ?z1 ?b)
			(:task !decrement ?i)
			(:task build-stack ?x1 ?y1 ?z1 ?b ?i)))




	(:method (build-wall ?x1 ?y ?z1 ?b ?i ?j)
           	0-height-wall
           	((call = ?i 0)
	        (call <= ?j 10) (at ?player ?x ?y ?z))
           	()
		
		0-length-wall
           	((call <= ?i 10)
		(call = ?j 0) (at ?player ?x ?y ?z))
           	()

		i-j-wall
           	((call <= ?i 10) (call <= ?j 10) (at ?player ?x ?y ?z) 
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4) (up ?y6 ?y5) (up ?y7 ?y6) 
		(up ?y8 ?y7) (up ?y9 ?y8) (up ?y10 ?y9) (right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) 
		(right ?x4 ?x3) (right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (right ?x11 ?x10) (front ?z1 ?z)
		(block-at-inventory ?b ?n) (call >= ?n 100))
           	(:ordered 
			(:task build-stack ?x1 ?y ?z1 ?b ?i)
			(:task !decrement ?j)
			(:task build-wall ?x2 ?y ?z1 ?b ?i j)))
	


; State axioms

        (:- (clear ?x ?y ?z)
	    ((not (block-at ?block-type ?x ?y ?z))))))




(defproblem flex-wall creative

	((at player 0 0 0)
	(block-at-inventory stone 110)
	(right 1 0)
	(right 2 1)
	(right 3 2)
	(right 4 3)
	(right 5 4)
	(right 6 5)
	(right 7 6)
	(right 8 7)
	(right 9 8)
	(right 10 9)
	(right 11 10)
	(front 1 0)
	(front 2 1)
	(up 1 0)
	(up 2 1)
	(up 3 2)
	(up 4 3)
	(up 5 4)
	(up 6 5)
	(up 7 6)
	(up 8 7)
	(up 9 8)
	(up 10 9)
	(block-at wood 1 0 1))

	((build-wall 1 0 1 stone 3 4)))


(shop-trace :methods :operators)
(find-plans 'flex-wall :verbose :plans)
		

