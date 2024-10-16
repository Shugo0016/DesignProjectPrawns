// Making sure the worm moves
if (global.pause = true) {
	x = x
	y = y
}
else {
x += xspd
y += 0
//segmentNum = 
// Adding some random movement varience for fun
//xspd += random_range(-0.5,0.5)
//spd += random_range(-0.5,0.5)

// Adding a speed cap, so the worms don't go too fast
if xspd > spdCap{
	xspd = spdCap
}
if yspd > spdCap{
	yspd = spdCap
}

if xspd < (0-spdCap){
	xspd = (0-spdCap)
}
if yspd < (0-spdCap){
	yspd = (0-spdCap)
}

//turn around worm
if x > (room_width) or x < (0) {
	xspd *= -1
	y+=dspd
	//x += (room_width + sprite_width)
}

if y > room_height  or y < 0{
	dspd *= -1
	y+= dspd
}

if collision_circle(x,y,10,obj_target,false,false) or collision_circle(x,y,30,obj_safe_zone,false,false){// or collision_circle(x,y,10,obj_head,false,false){
	xspd *= -1
	y+=dspd
	//x += (room_width + sprite_width)
}
/*

if collision_circle(x,y,25,obj_head,false,true) {
	xspd *= -1
	x += xspd*2
}
*/


// This is what's recording the x and y positions of the head of the worm
xpos[myTime] = x
ypos[myTime] = y
// This advances where the position is being written in the array
myTime += 1

// Chaning the sprite frame, so you can tell they are different worms
image_index = myNum


if collision_circle(x,y,25,obj_bullet,false,true) {
	//obj_worm_manager.segmentNum -=1
	nearest_bullet = instance_nearest(x,y,obj_bullet)
	instance_destroy(nearest_bullet)
	
	//instance_
	instance_create_depth(x,y,0,obj_target)
	reassignHeads(0,self.id,false)
	
	//array_delete(obj_worm_manager.centipede_array,whichPart,1)
	instance_destroy()
	global.TOTAL_POINTS += 100
	//instance_create_depth(x,y,0,obj_target)
	obj_worm_manager.segmentNum -=1
	audio_play_sound(snd_centipede_shot,1, false)

}
}

