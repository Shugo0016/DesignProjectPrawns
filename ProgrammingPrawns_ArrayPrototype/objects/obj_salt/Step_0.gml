/// @description Insert description here
// You can write your code in this editor
x += x_spd
y -= y_spd

//y_spd = grav_amt

image_angle += rot_speed

//shrink the scales
image_xscale -= size_decay
image_yscale -= size_decay


if image_xscale <= 0  or image_yscale <= 0 {
	instance_destroy()
}
if collision_circle(x, y, 4, obj_target,false,true) 
	or collision_circle(x, y, 4, obj_body,false,true) {
	//or collision_circle(x, y, 4, obj_spider,false,true){
		instance_destroy()
	}
