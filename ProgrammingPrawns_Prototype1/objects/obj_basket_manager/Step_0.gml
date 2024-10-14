/// @description Insert description here
// You can write your code in this editor
if display_error == true {
	draw_text(room_width/2,room_height/2,"WRONG");
	error_timer -=1
    if error_timer == 0 {
		display_error = false
		error_timer = 30
		
	}
	
}