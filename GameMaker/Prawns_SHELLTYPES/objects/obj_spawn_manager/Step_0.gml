/// @description Insert description here
// You can write your code in this editor
timer -= 1;
randomize()

if room = Room1 {
if timer == 0 {
	spawn_y = random_range(spawn_point_y, spawn_point_y+150);
	this_obj = instance_create_depth(x,spawn_y,0,obj_collectable);

	timer = 100;
}
}

else {
	if timer == 0 {
	spawn_x = random_range(50, room_width - 50);
	this_obj = instance_create_depth(spawn_x,-50,0,obj_collectable);
	
	timer = timer_max;
	}
}

if global.total_score > 7 {
	timer_max = 100
}