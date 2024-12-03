/// @description Insert description here
// You can write your code in this editor
if activated {
	global.SCORE += 1
	if room == Room1 { room = Room2 }
	else if room == Room2 { room = Room3 }
	else if room == Room3 { room = ScoreRoom }
}