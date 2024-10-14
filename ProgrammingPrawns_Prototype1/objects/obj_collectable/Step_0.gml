/// @description Insert description here
// You can write your code in this editor
curr_x = x;
curr_y = y;
x -= base_speed;
if collision_circle(x,y,32,obj_cursor,false,false) and !obj_cursor.selecting  {
	obj_cursor.selecting = true;
	image_xscale = 1.2;
	image_yscale = 1.2;
	
	
	if mouse_check_button(mb_any) {
		x = mouse_x-16;
		y = mouse_y;
		image_blend = c_aqua;
	}
	else {
		x = curr_x;
		y = curr_y;
	}
	
}
else {
	obj_cursor.selecting = false;
	image_xscale = 1;
	image_yscale = 1;
	image_blend = -1;
}

if collision_circle(x,y,32,obj_basket,false,false) {
	this_basket = instance_nearest(x, y, obj_basket)
	if this_basket.collect_type == variable_type {
		if mouse_check_button_released(mb_any) {
		obj_basket_manager.total_score += 1;
		instance_destroy(self);
		}
	}
	else if this_basket.collect_type != variable_type{
		if mouse_check_button_released(mb_any) {
		obj_basket_manager.total_score -= 1;
		obj_basket_manager.display_error = true;
		
		instance_destroy(self);
		}
	}
}


if x < -20 {
	instance_destroy(self);
	room = Room2;
}
