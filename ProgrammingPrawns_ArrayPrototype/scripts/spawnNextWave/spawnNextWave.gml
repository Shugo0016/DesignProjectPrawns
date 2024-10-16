
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnNextWave(_numWaves,_segmentNum){
	//DISPLAY a "NEXT WAVE START" indication!
	global.NEXTWAVESTART = true
	//spawnNextWave(0, segmentNum)
	var this_waves = _numWaves
	if _numWaves > _segmentNum {
	   this_waves = _numWaves % 10
	}
var headMade = instance_create_depth(room_width,20,0,obj_head)

for (var i = 0; i < (_segmentNum - this_waves); i++) {
	// Storing the instance id in this temporary variable
	var newbody = instance_create_depth(x,y,0,obj_body)
	// This is to count what segment I'm on when I'm creating these segments
	headMade.segmentCreateCount += 1
	// This transfers over to the segment or body part to let it know what order it should be in
	newbody.whichPart = headMade.segmentCreateCount
	// This tells the body part what head it's supposed to be following, otherwise, they would all follow one head
	newbody.whichHead = headMade.id
	// This transfers the body color, just for fun
	//newbody.bodyColor = make_color_hsv(headMade.randomBodyColor, 255, abs((newbody.whichPart/((_segmentNum+1))-1) *255.0)
	//centipede_array[i] = newbody
}
for (var i = 0; i < this_waves; i++) {
	var newHead = instance_create_depth(x-(10* (i+ 80)),y+ 50,0,obj_head)
}


}