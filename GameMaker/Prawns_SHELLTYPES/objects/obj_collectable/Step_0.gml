/// @description Insert description here
// You can write your code in this editor




	
	y+= base_speed
	if y > room_height {
		instance_destroy(self);
	}
	if collision_circle(x,y,32,obj_basket,false,false) { //collide with player basket
		if obj_basket.collect_type == variable_type {
			global.total_score += 1;
			obj_basket_manager.display_great = true;
			
			instance_destroy(self);
			
		}
		else if obj_basket.collect_type != variable_type {
		//global.total_score -= 1;
		obj_basket_manager.display_error = true;
		global.strikes +=1;
		
		
		
		instance_destroy(self);
			
		}
	}

