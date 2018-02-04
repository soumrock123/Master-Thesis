(define (problem wall)
	(:domain walls)
	(:objects 
	x-1 x0 x1 x2 x3 x4 x5 x6 x7 x8 - count
	y-1 y0 y1 y2 y3 y4 y5 y6 y7 y8 - count
	z0 z1 - count
	)
	(:init (= (block-at-inventory stone) 70) (= (block-at-inventory wood) 20) (= (total-cost) 0) 
	(up y0 y-1) (up y1 y0) (up y2 y1) (up y3 y2) (up y4 y3) (up y5 y4) (up y6 y5) (up y7 y6)
	(right x1 x0) (right x2 x1) (right x3 x2) (right x4 x3) (right x5 x4) (right x6 x5) 
	(right x7 x6) (right x8 x7) (front z1 z0)
	)
	(:goal (and 
		(block-at stone x1 y0 z1) (block-at stone x1 y1 z1) (block-at stone x1 y2 z1) (block-at stone x1 y3 z1)
		(block-at stone x1 y4 z1) (block-at stone x1 y5 z1) (block-at stone x1 y6 z1) (block-at stone x1 y7 z1)
		(block-at stone x2 y0 z1) (block-at stone x2 y1 z1) (block-at stone x2 y2 z1) (block-at stone x2 y3 z1)
		(block-at stone x2 y4 z1) (block-at stone x2 y5 z1) (block-at stone x2 y6 z1) (block-at stone x2 y7 z1)
		(block-at stone x3 y0 z1) (block-at stone x3 y1 z1) (block-at stone x3 y2 z1) (block-at stone x3 y3 z1)
		(block-at stone x3 y4 z1) (block-at stone x3 y5 z1) (block-at stone x3 y6 z1) (block-at stone x3 y7 z1)
		(block-at stone x4 y0 z1) (block-at stone x4 y1 z1) (block-at stone x4 y2 z1) (block-at stone x4 y3 z1)
		(block-at stone x4 y4 z1) (block-at stone x4 y5 z1) (block-at stone x4 y6 z1) (block-at stone x4 y7 z1)
		(block-at stone x5 y0 z1) (block-at stone x5 y1 z1) (block-at stone x5 y2 z1) (block-at stone x5 y3 z1)
		(block-at stone x5 y4 z1) (block-at stone x5 y5 z1) (block-at stone x5 y6 z1) (block-at stone x5 y7 z1)
		(block-at stone x6 y0 z1) (block-at stone x6 y1 z1) (block-at stone x6 y2 z1) (block-at stone x6 y3 z1)
		(block-at stone x6 y4 z1) (block-at stone x6 y5 z1) (block-at stone x6 y6 z1) (block-at stone x6 y7 z1)
		(block-at stone x7 y0 z1) (block-at stone x7 y1 z1) (block-at stone x7 y2 z1) (block-at stone x7 y3 z1)
		(block-at stone x7 y4 z1) (block-at stone x7 y5 z1) (block-at stone x7 y6 z1) (block-at stone x7 y7 z1)
		(block-at stone x8 y0 z1) (block-at stone x8 y1 z1) (block-at stone x8 y2 z1) (block-at stone x8 y3 z1)
		(block-at stone x8 y4 z1) (block-at stone x8 y5 z1) (block-at stone x8 y6 z1) (block-at stone x8 y7 z1))
	)
	(:metric minimize (total-cost))
	)