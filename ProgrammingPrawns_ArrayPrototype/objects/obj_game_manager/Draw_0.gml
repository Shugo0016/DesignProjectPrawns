/// @description Insert description here
// You can write your code in this editor
//draw_sprite_ext(spr_background,0,0,0,1,1,0,c_white,1)


draw_set_font(fnt_20)

if room = RoomStart {
	
	draw_text_color(70,200,"AAUGH!! Bugs have taken over the office!!",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,280,"Spiders do not care about business cards...",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,400,"Points:",c_white,c_white,c_white,c_white,1)
	draw_text_color(room_width/2 - 100,560,"Press ENTER to Start!",c_white,c_white,c_white,c_white,1)

	draw_set_font(fnt_16)
	draw_text_color(70,230,"Hit space to throw your business cards at them!",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,310,"Hold down the space bar until the gauge is full to throw salt at spiders!",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,430,"Centipede Body - 10 points",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,460,"Centipede Head - 100 points",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,490,"Spider         - 15 points",c_white,c_white,c_white,c_white,1)
	draw_text_color(70,520,"Office Items   - 4 points",c_white,c_white,c_white,c_white,1)

}

if global.GAMEOVER = true {
	
	draw_set_font(fnt_20)
	draw_text_color(70,200,"[NOOOOO!!!!!]",c_white,c_white,c_white,c_white,1)
	
	draw_set_font(fnt_16)
	draw_text_color(70,230,"The bugs are just too much..",c_white,c_white,c_white,c_white,1)
	
	draw_set_font(fnt_302)
	draw_text_color(70,280,"FINAL SCORE:",c_white,c_white,c_white,c_white,1)
	draw_text_color(250 ,320,global.TOTAL_POINTS,c_white,c_white,c_white,c_white,1)
	//draw_text_color(70,400,"Points:",c_white,c_white,c_white,c_white,1)
	draw_set_font(fnt_20)
	draw_text_color(room_width/2 - 100,room_height-200,"Press ENTER to Try Again!",c_white,c_white,c_white,c_white,1)
	
	draw_set_font(fnt_20)
	//draw_highscore(room_width/2, room_width/2, 300, 300);
	//draw_highscore(100, 100, room_width - 100, room_height - 100);
	/*
	draw_text_color(room_width/2 - 100,200,"TOP 3 SCORES:",c_white,c_white,c_white,c_white,1)
	for (i = 0; i<3; i++) {
		draw_text_color(room_width/2 - 100,230 + (i * 30),global.HIGH_SCORES[i] ,c_white,c_white,c_white,c_white,1)
	}
	
	draw_text_color(room_width/2 - 100,100,array_length(global.HIGH_SCORES),c_white,c_white,c_white,c_white,1)
	*/
}