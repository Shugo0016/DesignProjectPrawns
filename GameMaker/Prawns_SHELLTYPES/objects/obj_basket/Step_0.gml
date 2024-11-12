/// @description Insert description here
// You can write your code in this editor
	x = obj_player.x
	y = obj_player.y - 50;
	
	if keyboard_check_pressed(vk_space)  {
		if collect_type == "int" { collect_type = "float" }
		else if collect_type == "float" { collect_type = "string" }
		else if collect_type == "string" { collect_type = "bool" }
		else if collect_type == "bool" { collect_type = "int" }
	}


