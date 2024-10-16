/// @description Insert description here
// You can write your code in this editor


draw_self()

draw_set_font(fnt_16)
draw_text_color(room_width/2- 60,room_height - 40,"SCORE:",c_white,c_white,c_white,c_white,1)

draw_text_color(room_width/2 + 40,room_height - 40,global.TOTAL_POINTS,c_white,c_white,c_white,c_white,1)


draw_text_color(room_width/2- 60 ,room_height -70,"LIVES LEFT:" ,c_white,c_white,c_white,c_white,1)

draw_text_color(room_width/2 + 60,room_height - 70,num_lives,c_white,c_white,c_white,c_white,1)
draw_set_font(fnt_16)
draw_text_color(x- 3,y + 20, hold_timer,c_white,c_white,c_white,c_white,1)

