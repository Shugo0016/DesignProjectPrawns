/// @description Insert description here
// You can write your code in this editor
if collision_circle(x,y,32,obj_cursor,true,true) and mouse_check_button_pressed(mb_any) {
	clicked = true;
	moves -=1
}

if moves == -1 and !obj_win_screen.activated{
	room = ScoreRoom
}