/// @description Insert description here
// You can write your code in this editor
timer -= 1;

if timer == 0 {
	this_obj = instance_create_depth(x,y,0,obj_collectable);
	
	//get random type:
	/*
	var_type = irandom(4);
	this_obj.mynum = var_type;
	if var_type = 0 { this_obj.variable_type = "int";}
	else if var_type = 1 { this_obj.variable_type = "string";}
	else if var_type = 2 { this_obj.variable_type = "bool";}
	else { this_obj.variable_type = "float";}
	*/
	
	//else if var_type = 3 { this_obj.variable_type = "bool";}
	timer = 70;
}