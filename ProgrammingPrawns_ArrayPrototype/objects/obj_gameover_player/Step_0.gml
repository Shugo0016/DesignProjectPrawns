/// @description Insert description here
// You can write your code in this editor

x+= xspd
y+= yspd

if (y > room_width/2) or (y< 140) {
	yspd *= -1
}

if (x > room_width/2) or (x< 140) {
	xspd *= -1
}

