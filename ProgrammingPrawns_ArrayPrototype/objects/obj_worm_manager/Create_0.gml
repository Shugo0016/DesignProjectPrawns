// This is how many worms I want to create
headsToMake = 1
// This variable is only used so basically the different worms have different faces
whichHead = 0

var headMade = instance_create_depth(random_range(0,room_width),20,0,obj_head)
whichHead += 1
headMade.myNum = whichHead
	
	
segmentNum = 8
headMade.segmentNum = segmentNum


centipede_array = []

// This creates the worm bodies based on the segment length in "segmentNum"
spawnNextWave(0, 10)