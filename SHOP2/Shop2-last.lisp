(defdomain final-house (




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


		  
		  
		  
	
	(:method (fill-eleven-xy ?x1 ?y0 ?z1 ?d)
		((up ?y ?y0) (right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (right ?x11 ?x10)
		(block-at-inventory ?d ?n) (call >= ?n 12))
		(:ordered 
		  (build-block ?x1 ?y0 ?z1 ?d) (build-block ?x2 ?y0 ?z1 ?d) (build-block ?x3 ?y0 ?z1 ?d)
		  (build-block ?x4 ?y0 ?z1 ?d) (build-block ?x5 ?y0 ?z1 ?d) (build-block ?x6 ?y0 ?z1 ?d)
		  (build-block ?x7 ?y0 ?z1 ?d) (build-block ?x8 ?y0 ?z1 ?d) (build-block ?x9 ?y0 ?z1 ?d)
		  (build-block ?x10 ?y0 ?z1 ?d) (build-block ?x11 ?y0 ?z1 ?d)))
		  
		  
		  
		  
	
	(:method (fill-nine-yz ?x1 ?y0 ?z2 ?d)
		((up ?y ?y0) (front ?z1 ?z)
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) (front ?z6 ?z5)
		(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9)
		(block-at-inventory ?d ?n) (call >= ?n 10))
		(:ordered 
		  (build-block ?x1 ?y0 ?z2 ?d) (build-block ?x1 ?y0 ?z3 ?d) (build-block ?x1 ?y0 ?z4 ?d)
		  (build-block ?x1 ?y0 ?z5 ?d) (build-block ?x1 ?y0 ?z6 ?d) (build-block ?x1 ?y0 ?z7 ?d)
		  (build-block ?x1 ?y0 ?z8 ?d) (build-block ?x1 ?y0 ?z9 ?d) (build-block ?x1 ?y0 ?z10 ?d)))
	
	
	

	(:method (floor-border-xy ?x2 ?y ?z2 ?e ?f ?g)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (right ?x11 ?x10)
		(block-at-inventory ?e ?n) (call >= ?n 5)
		(block-at-inventory ?f ?m) (call >= ?m 5)
		(block-at-inventory ?g ?o) (call >= ?o 2))
		(:ordered 
		  (build-block ?x2 ?y ?z2 ?e) (build-block ?x3 ?y ?z2 ?f) (build-block ?x4 ?y ?z2 ?f) 
		  (build-block ?x5 ?y ?z2 ?f) (build-block ?x6 ?y ?z2 ?e) (build-block ?x7 ?y ?z2 ?g) 
		  (build-block ?x8 ?y ?z2 ?e) (build-block ?x9 ?y ?z2 ?f) (build-block ?x10 ?y ?z2 ?e)))
		  
		  
		  
		  
		  
	
	(:method (floor-border-yz ?x2 ?y ?z3 ?e ?f)
		((front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) 
		(front ?z6 ?z5) (front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9)
		(block-at-inventory ?e ?n) (call >= ?n 2)
		(block-at-inventory ?f ?m) (call >= ?m 8))
		(:ordered 
		  (build-block ?x2 ?y ?z3 ?f) (build-block ?x2 ?y ?z4 ?f)
		  (build-block ?x2 ?y ?z5 ?f) (build-block ?x2 ?y ?z6 ?f) (build-block ?x2 ?y ?z7 ?f) 
		  (build-block ?x2 ?y ?z8 ?f) (build-block ?x2 ?y ?z9 ?f) (build-block ?x2 ?y ?z10 ?e)))
		  
		  
		  
		  
		  
	(:method (fill-blocks-xy ?x3 ?y ?z3 ?f)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8)
		(block-at-inventory ?f ?m) (call >= ?m 8))
		(:ordered 
		  (build-block ?x3 ?y ?z3 ?f) (build-block ?x4 ?y ?z3 ?f)
		  (build-block ?x5 ?y ?z3 ?f) (build-block ?x6 ?y ?z3 ?f) 
		  (build-block ?x7 ?y ?z3 ?f) (build-block ?x8 ?y ?z3 ?f) (build-block ?x9 ?y ?z3 ?f)))
		  
		  
		  	  
		  
		  
	(:method (fill-bricks-xy ?x3 ?y ?z5 ?h)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8)
		(block-at-inventory ?h ?i) (call >= ?i 8))
		(:ordered 
		  (build-block ?x3 ?y ?z5 ?h) (build-block ?x4 ?y ?z5 ?h)
		  (build-block ?x5 ?y ?z5 ?h) (build-block ?x6 ?y ?z5 ?h) 
		  (build-block ?x7 ?y ?z5 ?h) (build-block ?x8 ?y ?z5 ?h) (build-block ?x9 ?y ?z5 ?h)))
		  
		  
		  
		  
	(:method (house-wall-yz ?x3 ?y1 ?z6 ?i ?j ?w)
		((front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) 
		(front ?z5 ?z4) (front ?z6 ?z5)	(front ?z7 ?z6) (front ?z8 ?z7)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2)
		(block-at-inventory ?i ?m) (call >= ?m 7)
		(block-at-inventory ?w ?v) (call >= ?v 2)
		(block-at-inventory ?j ?n) (call >= ?n 3))
		(:ordered 
		  (build-block ?x3 ?y1 ?z6 ?i) (build-block ?x3 ?y2 ?z6 ?i) (build-block ?x3 ?y3 ?z6 ?i)
		  (build-block ?x3 ?y1 ?z7 ?j) (build-block ?x3 ?y2 ?z7 ?w) (build-block ?x3 ?y3 ?z7 ?j)
		  (build-block ?x3 ?y1 ?z8 ?i) (build-block ?x3 ?y2 ?z8 ?i) (build-block ?x3 ?y3 ?z8 ?i)))



		  
		  
	(:method (house-backwall ?x4 ?y1 ?z9 ?i ?w)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) 
		(front ?z5 ?z4) (front ?z6 ?z5)	(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2)
		(block-at-inventory ?i ?m) (call >= ?m 15)
		(block-at-inventory ?w ?v) (call >= ?v 5))
		(:ordered 
		  (build-block ?x4 ?y1 ?z9 ?i) (build-block ?x4 ?y2 ?z9 ?i) (build-block ?x4 ?y3 ?z9 ?i)
		  (build-block ?x5 ?y1 ?z9 ?i) (build-block ?x5 ?y2 ?z9 ?w) (build-block ?x5 ?y3 ?z9 ?i)
		  (build-block ?x6 ?y1 ?z9 ?i) (build-block ?x6 ?y2 ?z9 ?i) (build-block ?x6 ?y3 ?z9 ?i)
		  (build-block ?x7 ?y1 ?z9 ?i) (build-block ?x7 ?y2 ?z9 ?w) (build-block ?x7 ?y3 ?z9 ?i)
		  (build-block ?x8 ?y1 ?z9 ?i) (build-block ?x8 ?y2 ?z9 ?i) (build-block ?x8 ?y3 ?z9 ?i)))
		  
		  
		  
		  
		  
	(:method (house-frontwall ?x4 ?y1 ?z5 ?i ?door ?w)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) 
		(front ?z5 ?z4) (up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2)
		(block-at-inventory ?i ?m) (call >= ?m 15)
		(block-at-inventory ?door ?u) (call >= ?u 2)
		(block-at-inventory ?w ?v) (call >= ?v 2))
		(:ordered 
		  (build-block ?x4 ?y1 ?z5 ?i) (build-block ?x4 ?y2 ?z5 ?i) (build-block ?x4 ?y3 ?z5 ?i)
		  (build-block ?x5 ?y1 ?z5 ?i) (build-block ?x5 ?y2 ?z5 ?w) (build-block ?x5 ?y3 ?z5 ?i)
		  (build-block ?x6 ?y1 ?z5 ?i) (build-block ?x6 ?y2 ?z5 ?i) (build-block ?x6 ?y3 ?z5 ?i)
		  (build-door ?x7 ?y1 ?z5 ?door) (build-block ?x7 ?y3 ?z5 ?i)
		  (build-block ?x8 ?y1 ?z5 ?i) (build-block ?x8 ?y2 ?z5 ?i) (build-block ?x8 ?y3 ?z5 ?i)))
		  
		 



	(:method (pillars-yz ?x3 ?y1 ?z5 ?d)
		((front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) 
		(front ?z5 ?z4) (front ?z6 ?z5)	(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2)
		(block-at-inventory ?d ?n) (call >= ?n 5))
		(:ordered 
		  (build-block ?x3 ?y1 ?z5 ?d) (build-block ?x3 ?y2 ?z5 ?d) (build-block ?x3 ?y3 ?z5 ?d)
		  (build-block ?x3 ?y1 ?z9 ?d) (build-block ?x3 ?y2 ?z9 ?d) (build-block ?x3 ?y3 ?z9 ?d)))


		  

	(:method (basicroof-xy ?x3 ?y4 ?z6 ?e)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) (right ?x9 ?x8)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3)
		(block-at-inventory ?e ?n) (call >= ?n 8))
		(:ordered 
		  (build-block ?x3 ?y4 ?z6 ?e) (build-block ?x4 ?y4 ?z6 ?e) (build-block ?x5 ?y4 ?z6 ?e)
		  (build-block ?x6 ?y4 ?z6 ?e) (build-block ?x7 ?y4 ?z6 ?e) (build-block ?x8 ?y4 ?z6 ?e)
		  (build-block ?x9 ?y4 ?z6 ?e))) 
	

	
	
	(:method (roofplanks-xy ?x3 ?y3 ?z3 ?f)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) (right ?x9 ?x8) (right ?x10 ?x9)
		(block-at-inventory ?f ?m) (call >= ?m 10))
		(:ordered 
		  (build-block ?x3 ?y3 ?z3 ?f) (build-block ?x2 ?y3 ?z3 ?f) (build-block ?x4 ?y3 ?z3 ?f)
		  (build-block ?x5 ?y3 ?z3 ?f) (build-block ?x6 ?y3 ?z3 ?f) (build-block ?x7 ?y3 ?z3 ?f)
		  (build-block ?x8 ?y3 ?z3 ?f) (build-block ?x9 ?y3 ?z3 ?f) (build-block ?x10 ?y3 ?z3 ?f))) 


	
	
	(:method (roofstairs-xy ?x3 ?y4 ?z5 ?g)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) (right ?x9 ?x8) (right ?x10 ?x9)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4)
		(block-at-inventory ?g ?o) (call >= ?o 10))
		(:ordered 
		  (build-block ?x3 ?y4 ?z5 ?g) (build-block ?x2 ?y4 ?z5 ?g) (build-block ?x4 ?y4 ?z5 ?g)
		  (build-block ?x5 ?y4 ?z5 ?g) (build-block ?x6 ?y4 ?z5 ?g) (build-block ?x7 ?y4 ?z5 ?g)
		  (build-block ?x8 ?y4 ?z5 ?g) (build-block ?x9 ?y4 ?z5 ?g) (build-block ?x10 ?y4 ?z5 ?g)))


	
	
	(:method (roofblocks ?x3 ?y5 ?z7 ?e ?f ?g)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) (right ?x9 ?x8) (right ?x10 ?x9)
		(front ?z1 ?z) (front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) 
		(front ?z5 ?z4) (front ?z6 ?z5)	(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9)
		(up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4)
		(block-at-inventory ?e ?n) (call >= ?n 10)
		(block-at-inventory ?f ?m) (call >= ?m 10)
		(block-at-inventory ?g ?o) (call >= ?o 5))
		(:ordered 
		  (build-block ?x3 ?y5 ?z7 ?e) (build-block ?x4 ?y5 ?z7 ?e) (build-block ?x5 ?y5 ?z7 ?e)
		  (build-block ?x6 ?y5 ?z7 ?e) (build-block ?x7 ?y5 ?z7 ?e) (build-block ?x8 ?y5 ?z7 ?e)
		  (build-block ?x9 ?y5 ?z7 ?e) (build-block ?x3 ?y3 ?z4 ?e) (build-block ?x9 ?y3 ?z4 ?e)
		  (build-block ?x4 ?y3 ?z4 ?f) (build-block ?x5 ?y3 ?z4 ?f) (build-block ?x6 ?y3 ?z4 ?f)
		  (build-block ?x7 ?y3 ?z4 ?f) (build-block ?x8 ?y3 ?z4 ?f) (build-block ?x10 ?y3 ?z4 ?f)
		  (build-block ?x2 ?y3 ?z4 ?f) (build-block ?x2 ?y5 ?z7 ?f) (build-block ?x10 ?y5 ?z7 ?f)
		  (build-block ?x2 ?y4 ?z6 ?g) (build-block ?x2 ?y4 ?z8 ?g) (build-block ?x10 ?y4 ?z6 ?g)
		  (build-block ?x10 ?y4 ?z8 ?g)))
		  
		  
		  
		  
	(:method (oak-fence-yz ?x1 ?y ?z2 ?k)
		((front ?z1 ?z)
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) (front ?z6 ?z5)
		(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9) (front ?z11 ?z10)
		(up ?y1 ?y) (up ?y2 ?y1)
		(block-at-inventory ?k ?n) (call >= ?n 25))
		(:ordered 
		  (build-block ?x1 ?y ?z2 ?k) (build-block ?x1 ?y1 ?z2 ?k) (build-block ?x1 ?y ?z3 ?k)
		  (build-block ?x1 ?y1 ?z3 ?k) (build-block ?x1 ?y ?z4 ?k) (build-block ?x1 ?y1 ?z4 ?k)
		  (build-block ?x1 ?y ?z5 ?k) (build-block ?x1 ?y1 ?z5 ?k) (build-block ?x1 ?y ?z6 ?k)
		  (build-block ?x1 ?y1 ?z6 ?k) (build-block ?x1 ?y ?z7 ?k) (build-block ?x1 ?y1 ?z7 ?k)
		  (build-block ?x1 ?y ?z8 ?k) (build-block ?x1 ?y1 ?z8 ?k) (build-block ?x1 ?y ?z9 ?k)
		  (build-block ?x1 ?y1 ?z9 ?k) (build-block ?x1 ?y ?z10 ?k) (build-block ?x1 ?y1 ?z10 ?k)
		  (build-block ?x1 ?y ?z11 ?k) (build-block ?x1 ?y1 ?z11 ?k)))
		  
		  
		  
	
	(:method (oak-fence-end ?x2 ?y ?z11 ?k)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (right ?x11 ?x10) (front ?z1 ?z)
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) (front ?z6 ?z5)
		(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9) (front ?z11 ?z10)
		(up ?y1 ?y) (up ?y2 ?y1)
		(block-at-inventory ?k ?n) (call >= ?n 20))
		(:ordered 
		  (build-block ?x2 ?y ?z11 ?k) (build-block ?x2 ?y1 ?z11 ?k) (build-block ?x3 ?y ?z11 ?k)
		  (build-block ?x3 ?y1 ?z11 ?k) (build-block ?x4 ?y ?z11 ?k) (build-block ?x4 ?y1 ?z11 ?k)
		  (build-block ?x5 ?y ?z11 ?k) (build-block ?x5 ?y1 ?z11 ?k) (build-block ?x6 ?y ?z11 ?k)
		  (build-block ?x6 ?y1 ?z11 ?k) (build-block ?x7 ?y ?z11 ?k) (build-block ?x7 ?y1 ?z11 ?k)
		  (build-block ?x8 ?y ?z11 ?k) (build-block ?x8 ?y1 ?z11 ?k) (build-block ?x9 ?y ?z11 ?k)
		  (build-block ?x9 ?y1 ?z11 ?k) (build-block ?x10 ?y ?z11 ?k) (build-block ?x10 ?y1 ?z11 ?k)))
		  
		  
		  
		  
	
	(:method (oak-fence-front ?x1 ?y ?z1 ?k)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (right ?x11 ?x10) (front ?z1 ?z)
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) (front ?z6 ?z5)
		(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9) (front ?z11 ?z10)
		(up ?y1 ?y) (up ?y2 ?y1)
		(block-at-inventory ?k ?n) (call >= ?n 15))
		(:ordered 
		  (build-block ?x1 ?y ?z1 ?k) (build-block ?x1 ?y1 ?z1 ?k) (build-block ?x2 ?y ?z1 ?k)
		  (build-block ?x2 ?y1 ?z1 ?k) (build-block ?x3 ?y ?z1 ?k) (build-block ?x3 ?y1 ?z1 ?k)
		  (build-block ?x4 ?y ?z1 ?k) (build-block ?x4 ?y1 ?z1 ?k) (build-block ?x5 ?y ?z1 ?k)
		  (build-block ?x9 ?y ?z1 ?k) (build-block ?x10 ?y ?z1 ?k) (build-block ?x10 ?y1 ?z1 ?k)
		  (build-block ?x11 ?y ?z1 ?k) (build-block ?x11 ?y1 ?z1 ?k)))
		  
		  
		  
	
	(:method (fencing-and-decoration ?x10 ?y1 ?z5 ?o ?t ?j ?p)
		((right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (front ?z1 ?z) 
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) (front ?z6 ?z5)
		(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9)
		(up ?y1 ?y) (up ?y2 ?y1)
		(block-at-inventory ?o ?n) (call >= ?n 40)
		(block-at-inventory ?t ?m) (call >= ?m 5)
		(block-at-inventory ?j ?l) (call >= ?l 5)
		(block-at-inventory ?p ?s) (call >= ?s 2))
		(:ordered 
		  (build-block ?x10 ?y1 ?z5 ?o) (build-block ?x10 ?y1 ?z4 ?o) (build-block ?x10 ?y1 ?z3 ?o)
		  (build-block ?x10 ?y1 ?z2 ?o) (build-block ?x9 ?y1 ?z2 ?o) (build-block ?x8 ?y1 ?z2 ?o)
	 	  (build-block ?x6 ?y1 ?z2 ?o) (build-block ?x5 ?y1 ?z2 ?o) (build-block ?x4 ?y1 ?z2 ?o)
		  (build-block ?x3 ?y1 ?z2 ?o) (build-block ?x2 ?y1 ?z2 ?o) (build-block ?x2 ?y1 ?z3 ?o)
		  (build-block ?x2 ?y1 ?z4 ?o) (build-block ?x2 ?y1 ?z5 ?o) (build-block ?x10 ?y1 ?z10 ?o)
	 	  (build-block ?x2 ?y1 ?z10 ?o) (build-block ?x2 ?y2 ?z10 ?t) (build-block ?x10 ?y2 ?z10 ?t)
		  (build-block ?x10 ?y2 ?z2 ?t) (build-block ?x2 ?y2 ?z2 ?t) (build-block ?x3 ?y1 ?z3 ?j)
		  (build-block ?x5 ?y1 ?z3 ?j) (build-block ?x4 ?y1 ?z3 ?o) (build-block ?x4 ?y2 ?z3 ?p)))

		  
		  
	

		
	

	(:method (build-custom-house ?x1 ?y ?y0 ?z1 ?d ?e ?f ?g ?h ?i ?door ?w ?j ?k ?o ?t ?p)
		((at ?player ?x ?y ?z) (right ?x1 ?x) (right ?x2 ?x1) (right ?x3 ?x2) (right ?x4 ?x3)
		(right ?x5 ?x4) (right ?x6 ?x5) (right ?x7 ?x6) (right ?x8 ?x7) 
		(right ?x9 ?x8) (right ?x10 ?x9) (right ?x11 ?x10) (front ?z1 ?z) 
		(front ?z2 ?z1) (front ?z3 ?z2) (front ?z4 ?z3) (front ?z5 ?z4) (front ?z6 ?z5)
		(front ?z7 ?z6) (front ?z8 ?z7) (front ?z9 ?z8) (front ?z10 ?z9) (front ?z11 ?z10)
		(up ?y ?y0) (up ?y1 ?y) (up ?y2 ?y1) (up ?y3 ?y2) (up ?y4 ?y3) (up ?y5 ?y4)
		(block-at-inventory ?d ?n) (call >= ?n 60)
		(block-at-inventory ?e ?m) (call >= ?m 60)
		(block-at-inventory ?f ?u) (call >= ?u 110)
		(block-at-inventory ?g ?v) (call >= ?v 40)
		(block-at-inventory ?h ?var1) (call >= ?var1 50)
		(block-at-inventory ?i ?var2) (call >= ?var2 60)
		(block-at-inventory ?door ?var3) (call >= ?var3 5)
		(block-at-inventory ?w ?a) (call >= ?a 10)
		(block-at-inventory ?j ?l) (call >= ?l 10)
		(block-at-inventory ?k ?c) (call >= ?c 80)
		(block-at-inventory ?o ?q) (call >= ?q 50)
		(block-at-inventory ?t ?r) (call >= ?r 10)
		(block-at-inventory ?p ?s) (call >= ?s 5))
		(:ordered 
		  (fill-eleven-xy ?x1 ?y0 ?z1 ?d)
		  (fill-eleven-xy ?x1 ?y0 ?z11 ?d)
		  (fill-nine-yz ?x1 ?y0 ?z2 ?d)
		  (fill-nine-yz ?x11 ?y0 ?z2 ?d)
		  (floor-border-xy ?x2 ?y ?z2 ?e ?f ?g)
		  (floor-border-yz ?x2 ?y ?z3 ?e ?f)
		  (floor-border-yz ?x10 ?y ?z3 ?e ?f)
		  (fill-blocks-xy ?x3 ?y ?z3 ?f)
		  (fill-blocks-xy ?x3 ?y ?z4 ?f)
		  (fill-blocks-xy ?x3 ?y ?z10 ?f)
		  (fill-bricks-xy ?x3 ?y ?z5 ?h)
		  (fill-bricks-xy ?x3 ?y ?z6 ?h)
		  (fill-bricks-xy ?x3 ?y ?z7 ?h)
		  (fill-bricks-xy ?x3 ?y ?z8 ?h)
		  (fill-bricks-xy ?x3 ?y ?z9 ?h)
		  (pillars-yz ?x3 ?y1 ?z5 ?d)
		  (pillars-yz ?x9 ?y1 ?z5 ?d)
		  (house-wall-yz ?x3 ?y1 ?z6 ?i ?j ?w)
		  (house-backwall ?x4 ?y1 ?z9 ?i ?w)
		  (house-wall-yz ?x9 ?y1 ?z6 ?i ?j ?w)
		  (house-frontwall ?x4 ?y1 ?z5 ?i ?door ?w)
		  (basicroof-xy ?x3 ?y4 ?z6 ?e)
		  (basicroof-xy ?x3 ?y4 ?z7 ?e)
		  (basicroof-xy ?x3 ?y4 ?z8 ?e)
		  (fencing-and-decoration ?x10 ?y1 ?z5 ?o ?t ?j ?p)
		  (roofblocks ?x3 ?y5 ?z7 ?e ?f ?g)
		  (roofplanks-xy ?x3 ?y3 ?z3 ?f)
		  (roofplanks-xy ?x3 ?y3 ?z10 ?f)
		  (roofplanks-xy ?x3 ?y5 ?z8 ?f)
		  (roofplanks-xy ?x3 ?y5 ?z6 ?f)
		  (roofstairs-xy ?x3 ?y4 ?z5 ?g)
		  (roofstairs-xy ?x3 ?y4 ?z9 ?g)
		  (oak-fence-yz ?x1 ?y ?z2 ?k)
		  (oak-fence-end ?x2 ?y ?z11 ?k)
		  (oak-fence-yz ?x11 ?y ?z2 ?k)
		  (oak-fence-front ?x1 ?y ?z1 ?k)))
	




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




(defproblem final final-house

	((at player 0 0 0)
	(block-at-inventory oak-wood 70)
	(block-at-inventory spruce-wood-planks 70)
	(block-at-inventory spruce-wood-slab 120)
	(block-at-inventory spruce-wood-stairs 50) 
	(block-at-inventory bricks 70) 
	(block-at-inventory oak-wood-planks 80)
	(block-at-inventory oak-door 5)
	(block-at-inventory glass-pane 20)
	(block-at-inventory oak-wood-stairs 25)
	(block-at-inventory oak-leaves 90) 
	(block-at-inventory oak-fence 60) 
	(block-at-inventory torch 10) 
	(block-at-inventory wooden-pressure-plate 5)
	(right 0 -1)
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
	(right 12 11)
	(front 0 -1)
	(front 1 0)
	(front 2 1)
	(front 3 2)
	(front 4 3)
	(front 5 4)
	(front 6 5)
	(front 7 6)
	(front 8 7)
	(front 9 8)
	(front 10 9)
	(front 11 10)
	(front 12 11)
	(up 0 -1)
	(up 1 0)
	(up 2 1)
	(up 3 2)
	(up 4 3)
	(up 5 4)
	(block-at grass 1 -1 1)
	(block-at grass 2 -1 1)
	(block-at grass 3 -1 1)
	(block-at grass 4 -1 1)
	(block-at grass 5 -1 1)
	(block-at grass 6 -1 1)
	(block-at grass 7 -1 1)
	(block-at grass 8 -1 1)
	(block-at grass 9 -1 1)
	(block-at grass 10 -1 1)
	(block-at grass 11 -1 1)
	(block-at grass 1 -1 2)
	(block-at grass 2 -1 2)
	(block-at grass 3 -1 2)
	(block-at grass 4 -1 2)
	(block-at grass 5 -1 2)
	(block-at grass 6 -1 2)
	(block-at grass 7 -1 2)
	(block-at grass 8 -1 2)
	(block-at grass 9 -1 2)
	(block-at grass 10 -1 2)
	(block-at grass 11 -1 2)
	(block-at grass 1 -1 3)
	(block-at grass 2 -1 3)
	(block-at grass 3 -1 3)
	(block-at grass 4 -1 3)
	(block-at grass 5 -1 3)
	(block-at grass 6 -1 3)
	(block-at grass 7 -1 3)
	(block-at grass 8 -1 3)
	(block-at grass 9 -1 3)
	(block-at grass 10 -1 3)
	(block-at grass 11 -1 3)
	(block-at grass 1 -1 4)
	(block-at grass 2 -1 4)
	(block-at grass 3 -1 4)
	(block-at grass 4 -1 4)
	(block-at grass 5 -1 4)
	(block-at grass 6 -1 4)
	(block-at grass 7 -1 4)
	(block-at grass 8 -1 4)
	(block-at grass 9 -1 4)
	(block-at grass 10 -1 4)
	(block-at grass 11 -1 4)
	(block-at grass 1 -1 5)
	(block-at grass 2 -1 5)
	(block-at grass 3 -1 5)
	(block-at grass 4 -1 5)
	(block-at grass 5 -1 5)
	(block-at grass 6 -1 5)
	(block-at grass 7 -1 5)
	(block-at grass 8 -1 5)
	(block-at grass 9 -1 5)
	(block-at grass 10 -1 5)
	(block-at grass 11 -1 5)
	(block-at grass 1 -1 6)
	(block-at grass 2 -1 6)
	(block-at grass 3 -1 6)
	(block-at grass 4 -1 6)
	(block-at grass 5 -1 6)
	(block-at grass 6 -1 6)
	(block-at grass 7 -1 6)
	(block-at grass 8 -1 6)
	(block-at grass 9 -1 6)
	(block-at grass 10 -1 6)
	(block-at grass 11 -1 6)
	(block-at grass 1 -1 7)
	(block-at grass 2 -1 7)
	(block-at grass 3 -1 7)
	(block-at grass 4 -1 7)
	(block-at grass 5 -1 7)
	(block-at grass 6 -1 7)
	(block-at grass 7 -1 7)
	(block-at grass 8 -1 7)
	(block-at grass 9 -1 7)
	(block-at grass 10 -1 7)
	(block-at grass 11 -1 7)
	(block-at grass 1 -1 8)
	(block-at grass 2 -1 8)
	(block-at grass 3 -1 8)
	(block-at grass 4 -1 8)
	(block-at grass 5 -1 8)
	(block-at grass 6 -1 8)
	(block-at grass 7 -1 8)
	(block-at grass 8 -1 8)
	(block-at grass 9 -1 8)
	(block-at grass 10 -1 8)
	(block-at grass 11 -1 8)
	(block-at grass 1 -1 9)
	(block-at grass 2 -1 9)
	(block-at grass 3 -1 9)
	(block-at grass 4 -1 9)
	(block-at grass 5 -1 9)
	(block-at grass 6 -1 9)
	(block-at grass 7 -1 9)
	(block-at grass 8 -1 9)
	(block-at grass 9 -1 9)
	(block-at grass 10 -1 9)
	(block-at grass 11 -1 9)
	(block-at grass 1 -1 10)
	(block-at grass 2 -1 10)
	(block-at grass 3 -1 10)
	(block-at grass 4 -1 10)
	(block-at grass 5 -1 10)
	(block-at grass 6 -1 10)
	(block-at grass 7 -1 10)
	(block-at grass 8 -1 10)
	(block-at grass 9 -1 10)
	(block-at grass 10 -1 10)
	(block-at grass 11 -1 10)
	(block-at grass 1 -1 11)
	(block-at grass 2 -1 11)
	(block-at grass 3 -1 11)
	(block-at grass 4 -1 11)
	(block-at grass 5 -1 11)
	(block-at grass 6 -1 11)
	(block-at grass 7 -1 11)
	(block-at grass 8 -1 11)
	(block-at grass 9 -1 11)
	(block-at grass 10 -1 11)
	(block-at grass 11 -1 11)
	(block-at stone 1 1 3))

	((build-custom-house 1 0 -1 1 oak-wood spruce-wood-planks spruce-wood-slab spruce-wood-stairs bricks oak-wood-planks oak-door 	 	glass-pane oak-wood-stairs oak-leaves oak-fence torch wooden-pressure-plate)))


(shop-trace :methods :operators)
(find-plans 'final :verbose :plans)


