/// @description Insert description here
// You can write your code in this editor
/*
draw_text(200,500,global.my_array)

draw_text(200,300,global.string_array)
draw_text(200,350,global.goal_array)
for (i = 0; i < array_length(global.my_array); i++) {
	draw_text(200,515 + (i*11),array_get(global.my_array,i));
}
*/
draw_set_font(pixel18)
draw_text(50,50,"Drag in the array methods and fruit values!")
draw_text(50,80,"Match your fruit array to the goal array within 3 moves!")
