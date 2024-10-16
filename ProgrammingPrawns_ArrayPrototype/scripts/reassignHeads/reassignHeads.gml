// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reassignHeads(_currentPart,_currentHead, _makeNewHead){
	
	if _makeNewHead { //if we make a new head because we hit the segments
		if _currentPart != obj_worm_manager.segmentNum {
				var new_head = instance_create_depth(x,y,0,obj_head)
			with (obj_body) {
			    if (whichHead = _currentHead) {
					if whichPart > _currentPart {
			        whichHead = new_head
					whichPart -= _currentPart
					//whichPart = 0
			        }
			    }
			}
		}
	}
	else { // if we hit a head, we turn the behind into a head. (if theres a behind).
		var count = 0
		with (obj_body) {
			if (whichHead = _currentHead) {
				count += 1
			}
		}
		if count > 0 {
			var new_head = instance_create_depth(x,y,0,obj_head)
			/*if (whichHead = _currentHead) and whichPart = 1 {
					instance_destroy()
				*/
			with (obj_body) {
				if (whichHead = _currentHead) {
					if whichPart = 1 {
						instance_destroy()
					}
					if whichPart > 1 {
						whichHead = new_head
						whichPart -= 1
					}
				}
			}
		}
	}
}