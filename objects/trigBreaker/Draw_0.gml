if objBreakerPanel.image_index == 1
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
draw_text(x, y + sprite_height/2 + 2, objProfit.profit < 2500 ? $"Resign?\n(< {minimum})" : "Break?");

draw_reset();