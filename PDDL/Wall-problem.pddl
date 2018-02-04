(define (problem wall)
	(:domain walls)
	(:objects 
	c-1 c0 c1 c2 c3 c4 c5 c6 c7 c8 - count
	)
	(:init (= (block-at-inventory stone) 70) (= (block-at-inventory wood) 20) (= (total-cost) 0) 
	(adjacent c-1 c0) (adjacent c0 c1) (adjacent c1 c2) (adjacent c2 c3)
	(adjacent c3 c4) (adjacent c4 c5) (adjacent c5 c6) (adjacent c6 c7)
	(adjacent c7 c8) 
	(block-at grass c1 c-1 c1) (block-at wood c1 c5 c1) (block-at wood c3 c0 c1) (block-at wood c4 c5 c1) 
	(block-at wood c5 c7 c1)
	)
	(:goal (and 
		(block-at stone c1 c0 c1) (block-at stone c1 c1 c1) (block-at stone c1 c2 c1) (block-at stone c1 c3 c1)
		(block-at stone c1 c4 c1) (block-at stone c1 c5 c1) (block-at stone c1 c6 c1) (block-at stone c1 c7 c1)
		(block-at stone c2 c0 c1) (block-at stone c2 c1 c1) (block-at stone c2 c2 c1) (block-at stone c2 c3 c1)
		(block-at stone c2 c4 c1) (block-at stone c2 c5 c1) (block-at stone c2 c6 c1) (block-at stone c2 c7 c1)
		(block-at stone c3 c0 c1) (block-at stone c3 c1 c1) (block-at stone c3 c2 c1) (block-at stone c3 c3 c1)
		(block-at stone c3 c4 c1) (block-at stone c3 c5 c1) (block-at stone c3 c6 c1) (block-at stone c3 c7 c1)
		(block-at stone c4 c0 c1) (block-at stone c4 c1 c1) (block-at stone c4 c2 c1) (block-at stone c4 c3 c1)
		(block-at stone c4 c4 c1) (block-at stone c4 c5 c1) (block-at stone c4 c6 c1) (block-at stone c4 c7 c1)
		(block-at stone c5 c0 c1) (block-at stone c5 c1 c1) (block-at stone c5 c2 c1) (block-at stone c5 c3 c1)
		(block-at stone c5 c4 c1) (block-at stone c5 c5 c1) (block-at stone c5 c6 c1) (block-at stone c5 c7 c1)
		(block-at stone c6 c0 c1) (block-at stone c6 c1 c1) (block-at stone c6 c2 c1) (block-at stone c6 c3 c1)
		(block-at stone c6 c4 c1) (block-at stone c6 c5 c1) (block-at stone c6 c6 c1) (block-at stone c6 c7 c1)
		(block-at stone c7 c0 c1) (block-at stone c7 c1 c1) (block-at stone c7 c2 c1) (block-at stone c7 c3 c1)
		(block-at stone c7 c4 c1) (block-at stone c7 c5 c1) (block-at stone c7 c6 c1) (block-at stone c7 c7 c1)
		(block-at stone c8 c0 c1) (block-at stone c8 c1 c1) (block-at stone c8 c2 c1) (block-at stone c8 c3 c1)
		(block-at stone c8 c4 c1) (block-at stone c8 c5 c1) (block-at stone c8 c6 c1) (block-at stone c8 c7 c1))
	)
	(:metric minimize (total-cost))
	)