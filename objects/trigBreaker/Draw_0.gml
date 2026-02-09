if !active { exit; }

if round_won()
{
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	draw_reset();
	
	exit;
}

if objPlayer.faceDirection != "U" || !place_meeting(x, y + 5, objPlayer) || breaking { exit; }

draw_set_font(fntSmall);
draw_set_halign(fa_middle);

var minimum = global.level[global.currLevel].ranks[0];
draw_text(x, y + sprite_height/2 + 2, $"Break?\n(>= ${minimum} to pass)");

draw_reset();