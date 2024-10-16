/// @description Insert description here
// You can write your code in this editor

var curr_x = x
var curr_y = y
if !got_hit { 
	if canMove {
		if (keyboard_check(vk_up)) {
			y -= base_spd
			sprite_index = spr_walk_updown
		}

		else if (keyboard_check(vk_down)) {
			y += base_spd
			sprite_index = spr_walk_updown
		}

		if (keyboard_check(vk_right)) {
			x += base_spd
		}

		else if (keyboard_check(vk_left)) {
			x -= base_spd
		}
	}

	//y limit position

	if y < y_limit {
		y = y_limit
	}
	if y > room_height {
		y = room_height
	}

	if (keyboard_check(vk_space)) { 
		//Hold timer checks for how long the space was held before releaseing.
		space_pressed = true
		hold_timer += 1
		if !(audio_is_playing(snd_charging)) and (hold_timer>30) and (hold_timer<100) {
			audio_play_sound(snd_charging,1,false)
		}
		//instance_create_depth(x,y-10,0,obj_bullet)
		if hold_timer >= 100 
		{
			hold_timer = 100 //cap hold at 100
			sprite_index = spr_walk_updown_blink
			if !audio_is_playing(snd_holdcharge) {
			audio_play_sound(snd_holdcharge,1,false)
		}
		}
	}
	else {
		space_pressed = false
		//hold_timer = 
	}

	if space_pressed = false and hold_timer > 0 { // space is released!
		if hold_timer > 30 {
			audio_stop_sound(snd_charging)
		}
	
		if hold_timer < 100 {
			var bullet = instance_create_depth(x,y-10,0,obj_bullet)
			audio_play_sound(snd_shoot,1,false)
			//bullet.bullet_speed *= (hold_timer/40)
			hold_timer = 0
			space_pressed = false
		}
		else { // hold time larger than 40, this is a charge shot
			//chargeshot() //call script to generate the attack
			audio_play_sound(snd_chargeshot, 1, false);
			sprite_index = spr_walk_updown
			chargeShot(x-15,y,sprite_width-5, sprite_height-5, numParticles)
			audio_stop_sound(snd_holdcharge);
	
		}
		hold_timer = 0
	
	}

	if x > room_width {
		x = room_width
	}

	if x < 0 {
		x = 0
	}

	if y > room_height {
		y = room_height
	}


	//player runs into an enemy, lives -=1
	if (collision_circle (x,y,10,obj_spider,false,false) and (obj_spider.sprite_index != spr_spider_dead)) or collision_circle (x,y,10,obj_body,false,false) or collision_circle (x,y,10,obj_head,false,false) {
		if !got_hit { //only want this to happen Once per collision
			num_lives -=1 
		}
		got_hit = true
		hit_timer = hit_timer_max
		sprite_index = spr_player2
	
	}

	//prevent player going through target/mushroom obj
	if collision_circle(x,y,10,obj_target,false,false) {
		y = curr_y
		x = curr_x
	}
}

if got_hit { //player is hit
	canMove = false
	sprite_index = spr_player_dead
	image_angle += 30
	image_xscale -= 0.04
	image_yscale -= 0.04
if image_xscale <= 0  or image_yscale <= 0 {
	image_xscale = 0.1
	image_yscale = 0.1
}
	global.pause = true
	if hit_timer = hit_timer_max {
		audio_play_sound(snd_player_dies,1,false)
	}
	hit_timer -= 1
	if hit_timer = 0 {
		x = start_x
		y = start_y
		got_hit = false
		//sprite_index = spr_idle
		global.pause = false
		image_angle = 0
		image_xscale = 1
		image_yscale = 1
		sprite_index = spr_walk_updown
		x = obj_safe_zone.x
		y = obj_safe_zone.y
		canMove = true
		
	}
}

//if all lives lost - play death animation and send to Game Over
if num_lives = 0 and hit_timer = 0{
	global.GAMEOVER = true
	//room = RoomGameOver
}




