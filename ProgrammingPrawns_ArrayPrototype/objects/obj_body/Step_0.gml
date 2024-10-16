/// @description Insert description here
// You can write your code in this editor

//image_blend = bodyColor

//TWIST IDEAS?


//pos set based on array in whichHead
//head id stored in whichHead
if (global.pause = true) {
	x = x
	y = y
}
else {
if whichHead.myTime > (delayPerSegment * whichPart) {
	x = whichHead.xpos[whichHead.myTime - delayPerSegment * whichPart]
	y = whichHead.ypos[whichHead.myTime - delayPerSegment * whichPart]
}


if collision_circle(x,y,25,obj_bullet,false,true) {
	//obj_worm_manager.segmentNum -=1
	nearest_bullet = instance_nearest(x,y,obj_bullet)
	instance_destroy(nearest_bullet)
	
	//instance_
	instance_create_depth(x,y,0,obj_target)
	reassignHeads(whichPart,whichHead,true)
	audio_play_sound(snd_centipede_shot,1, false)
	
	//array_delete(obj_worm_manager.centipede_array,whichPart,1)
	instance_destroy()
	global.TOTAL_POINTS += 10
	//instance_create_depth(x,y,0,obj_target)
	obj_worm_manager.segmentNum -=1
}



}