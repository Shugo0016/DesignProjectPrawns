//when I reset, I'll see the ranomization
//randomize()

// Variables for where the position is going to be written in the following arrays
myTime = 0
// An array for the X Positions
xpos[myTime] = 0
// An array for the Y Positions
ypos[myTime] = 0

// This says how many segments will be in each worm
segmentNum = 0
segmentCreateCount = 0.0
myNum = 0

// For fun, I made it so each worm body has a differen color
randomBodyColor = random(255)

// Just setting random speed for fun
xspd = 6//random_range(4,10)
yspd = 9 // random_range(1,5)

dspd = 32

// This is so the worms don't get too fast
spdCap = 8

// Added color for fun
image_blend = c_yellow

image_xscale = random_range(1.9,2.0)
image_yscale = random_range(1.9,2.0)

isHead = true

