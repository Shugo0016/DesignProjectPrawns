/// @description Insert description here
// You can write your code in this editor


global.strikes = 0;
if room != Room13 {
int_basket = instance_create_depth(150,room_height-64,0,obj_basket);
int_basket.collect_type = "int";

str_basket = instance_create_depth(room_width/3 + 50,room_height-64,0,obj_basket);
str_basket.collect_type = "string";

bool_basket = instance_create_depth(890,room_height-64,0,obj_basket);
bool_basket.collect_type = "bool";

float_basket = instance_create_depth(room_width-100,room_height-64,0,obj_basket);
float_basket.collect_type = "float";

}


display_error = false
display_great = false
		error_timer = 30