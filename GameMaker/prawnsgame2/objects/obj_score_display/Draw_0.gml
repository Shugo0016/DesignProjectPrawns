/// @description Insert description here
// You can write your code in this editor
draw_set_font(pixel20)
if room == ScoreRoom {
draw_text(room_width/2-450,room_height/2 - 50,"NICE WORK!")
draw_text(room_width/2-450,room_height/2,"Levels Completed:")

}
draw_text(room_width/2+50,room_height/2,global.SCORE)