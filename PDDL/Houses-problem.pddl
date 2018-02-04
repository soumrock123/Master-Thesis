(define (problem simple-house)
	(:domain walls)
	(:objects 
	x0 x1 x2 x3 x4 x5 - count
	y0 y1 y2 y3 y4 y5 - count
	z0 z1 z2 z3 z4 z5 - count
	)
	(:init (= (block-at-inventory brick) 100) (= (block-at-inventory iron-door) 5) 
	(= (block-at-inventory glass-pane) 5) (= (block-at-inventory wood) 30) (= (total-cost) 0) 
	(up y1 y0) (up y2 y1) (up y3 y2) (up y4 y3)
	(right x1 x0) (right x2 x1) (right x3 x2) (right x4 x3) (right x5 x4)
	(front z1 z0) (front z2 z1) (front z3 z2) (front z4 z3) (front z5 z4)
	)
	(:goal (and 
		(block-at brick x1 y0 z1) (block-at brick x1 y1 z1) (block-at brick x1 y2 z1) (block-at brick x1 y3 z1)
		(block-at brick x1 y4 z1) (block-at brick x2 y0 z1) (block-at brick x2 y1 z1) (block-at brick x2 y2 z1)
		(block-at brick x2 y3 z1) (block-at brick x2 y4 z1) (block-at iron-door x3 y0 z1) (block-at iron-door x3 y1 z1)
		(block-at brick x3 y2 z1) (block-at brick x3 y3 z1)
		(block-at brick x3 y4 z1) (block-at brick x4 y0 z1) (block-at brick x4 y1 z1) (block-at brick x4 y2 z1)
		(block-at brick x4 y3 z1) (block-at brick x4 y4 z1) (block-at brick x5 y0 z1) (block-at brick x5 y1 z1)
		(block-at brick x5 y2 z1) (block-at brick x5 y3 z1) (block-at brick x5 y4 z1) (block-at brick x5 y0 z2)
		(block-at brick x5 y1 z2) (block-at brick x5 y2 z2) (block-at brick x5 y3 z2) (block-at brick x5 y4 z2)
		(block-at brick x5 y0 z3) (block-at brick x5 y1 z3) (block-at glass-pane x5 y2 z3) (block-at brick x5 y3 z3) 
		(block-at brick x5 y4 z3)
		(block-at brick x5 y0 z4) (block-at brick x5 y1 z4) (block-at brick x5 y2 z4) (block-at brick x5 y3 z4)
		(block-at brick x5 y4 z4) (block-at brick x5 y0 z5) (block-at brick x5 y1 z5) (block-at brick x5 y2 z5)
		(block-at brick x5 y3 z5) (block-at brick x5 y4 z5) (block-at brick x4 y0 z5) (block-at brick x4 y1 z5)
		(block-at brick x4 y2 z5) (block-at brick x4 y3 z5) (block-at brick x4 y4 z5) (block-at brick x3 y0 z5)
		(block-at brick x3 y1 z5) (block-at glass-pane x3 y2 z5) (block-at brick x3 y3 z5) (block-at brick x3 y4 z5) 
		(block-at brick x2 y0 z5)
		(block-at brick x2 y1 z5) (block-at brick x2 y2 z5) (block-at brick x2 y3 z5) (block-at brick x2 y4 z5)
		(block-at brick x1 y0 z5) (block-at brick x1 y1 z5) (block-at brick x1 y2 z5) (block-at brick x1 y3 z5)
		(block-at brick x1 y4 z5) (block-at brick x1 y0 z4) (block-at brick x1 y1 z4) (block-at brick x1 y2 z4)
		(block-at brick x1 y3 z4) (block-at brick x1 y4 z4) (block-at brick x1 y0 z3) (block-at brick x1 y1 z3)
		(block-at glass-pane x1 y2 z3) (block-at brick x1 y3 z3) (block-at brick x1 y4 z3) (block-at brick x1 y0 z2) 
		(block-at brick x1 y1 z2) (block-at brick x1 y2 z2) (block-at brick x1 y3 z2) (block-at brick x1 y4 z2))
	)
	(:metric minimize (total-cost))
)