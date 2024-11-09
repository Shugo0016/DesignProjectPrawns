/// @description Insert description here
// You can write your code in this editor
draw_text(x-70,y,"SCORE:")
draw_text(x +80,y,global.total_score)

if room != RoomOver {
//if global.strikes > 0 {
	draw_text(room_width-300,100,"STRIKES:")
	if global.strikes == 1 {draw_text(room_width-40,100,"X")}
	else if global.strikes == 2 {{draw_text(room_width-80,100,"X X")}}
	else if global.strikes == 3 {{draw_text(room_width-120,100,"X X X")}}

//}

//draw_text(room_width/2-100,room_height/2-100,error_timer);

if display_error == true {
	draw_text(obj_basket.x-30,obj_basket.y,"WRONG");
}
if display_great == true {
	draw_text(obj_basket.x-30,obj_basket.y,"GREAT");
}
}