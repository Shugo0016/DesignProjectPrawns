/// @description Insert description here
// You can write your code in this editor
total_score = 0;

int_basket = instance_create_depth(100,room_height-64,0,obj_basket);
int_basket.collect_type = "int";

str_basket = instance_create_depth(room_width/3,room_height-64,0,obj_basket);
str_basket.collect_type = "string";

bool_basket = instance_create_depth(800,room_height-64,0,obj_basket);
bool_basket.collect_type = "bool";

float_basket = instance_create_depth(room_width-100,room_height-64,0,obj_basket);
float_basket.collect_type = "float";


display_error = false
		error_timer = 30