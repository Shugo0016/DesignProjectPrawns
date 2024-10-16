// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function chargeShot(_x,_y,_xvar,_yvar, _amt){
for (i = 0; i < _amt; i+=1) {
		instance_create_depth(_x+random_range(0,_xvar),_y-random_range(0,_yvar),0,obj_salt)
	}
}