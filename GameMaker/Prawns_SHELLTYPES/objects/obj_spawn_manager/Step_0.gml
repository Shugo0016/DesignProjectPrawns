/// @description Insert description here
// You can write your code in this editor
timer -= 1;
randomize()

	if timer == 0 {
	spawn_x = random_range(50, room_width - 50);
	this_obj = instance_create_depth(spawn_x,-50,0,obj_collectable);
	
	timer = timer_max;
	}


if global.total_score > 7 {
	timer_max = 100
}