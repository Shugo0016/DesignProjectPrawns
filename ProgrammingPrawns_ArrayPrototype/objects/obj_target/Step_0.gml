/// @description Insert description here
// You can write your code in this editor

/*
x += base_xspd
y += base_yspd
if (x < 0) or (x > room_width) {
	base_xspd *= -1
}
*/

image_index = hitpoint

if collision_circle(x,y,20,obj_bullet,false,true) or collision_circle(x,y,20,obj_salt,false,true) {
	nearest_bullet = instance_nearest(x,y,obj_bullet)
	instance_destroy(nearest_bullet)
	hitpoint += 1
	audio_play_sound(snd_target, 1, false)
	if hitpoint == 4 {
		global.TOTAL_POINTS += 4
		instance_destroy()
		
		if !instance_exists(obj_target) {
		for (i = 0; i < 1; i++) {
			instance_create_depth(random_range(20,room_width-20),50,0,obj_target)
		}
		}
	}
}




