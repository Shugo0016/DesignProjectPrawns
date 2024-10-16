/// @description Insert description here
// You can write your code in this editor
var curr_x = x
var curr_y = y
var move_x = obj_player.x
var move_y = obj_player.y 


if global.pause = false {

	if canMove {
		move_towards_point(move_x,move_y,spd)
	}
	
	if obj_player.got_hit {
		x = start_x
		y = start_y
	}

	if collision_circle(x,y,15,obj_salt,false,false) or collision_circle(x,y,30,obj_safe_zone,false,false) {
		spider_died = true 
	}
	if spider_died = true {
		//play death animation
		//respawn at top of map
		sprite_index = spr_spider_dead
		spd = 0
		//screenShake()
		if image_index < 2 {
			dead = true
			/*
			if !audio_is_playing(snd_spd_dead){
				audio_play_sound(snd_spddead, 0, false)
			}
			}
		*/
		}
	
	}
	if image_index > 10 {
		x = start_x
		y = start_y
		sprite_index = spr_spider
		spd = base_spd
		global.TOTAL_POINTS += 15
	}
	spider_died = false
}
//screen wrapping
if x > room_width{
	x = 0
}
if x < 0{
	x = room_width
}
if y > room_height{
	y = 0
}
if y < 0{
	y = room_height
}