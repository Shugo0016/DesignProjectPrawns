/// @description Insert description here
// You can write your code in this editor

if (selecting) {
	x = mouse_x
	y = mouse_y
}
last_x = x
last_y = y

if collision_circle(x,y,32,obj_lane,true,true) and !selecting {
	if global.instructions[0] = 0 {
	global.instructions[0] = self;
	}
	if global.instructions[0] != self {
		x = start_x
		y = start_y
	}
}
