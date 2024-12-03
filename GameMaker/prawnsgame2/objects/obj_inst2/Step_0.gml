/// @description Insert description here
// You can write your code in this editor

if ( alarm[0] == -1) {
	if (selecting) {
	x = mouse_x
	y = mouse_y
	}
}
last_x = x
last_y = y

if collision_circle(x,y,32,obj_lane,true,true) and !selecting {
	if global.instructions[1] = 0 {
	global.instructions[1] = self;
	}
	if global.instructions[1] != self {
		x = start_x
		y = start_y
	}
}
