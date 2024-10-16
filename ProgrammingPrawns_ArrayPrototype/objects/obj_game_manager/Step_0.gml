/// @description Insert description here
// You can write your code in this editor




if room = RoomStart or global.GAMEOVER{
	if keyboard_check_pressed(vk_enter) {
		room = Room1
		//}
		global.GAMEOVER = false
		global.TOTAL_POINTS = 0
	}
	

}
if instance_number(obj_head) = 0 and instance_number(obj_body) = 0 {
	global.WAVE += 1
	spawnNextWave(global.WAVE,10)
	//(_numWaves,_segmentNum)
}

if global.GAMEOVER = true {
	while audio_is_playing(snd_bgm) {
		instance_create_depth(room_width/2,room_height/2, 0,obj_gameover_player)
		audio_stop_sound(snd_bgm)
	}

	instance_destroy(obj_body)
	instance_destroy(obj_head)
	instance_destroy(obj_spider)
	instance_destroy(obj_salt)
	instance_destroy(obj_player)
	instance_destroy(obj_target)
	//instance_destroy(obj_worm_manager)
	
	var thispoint = global.TOTAL_POINTS
}