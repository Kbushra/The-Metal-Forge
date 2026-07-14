if alarm[0] >= 0
{
	var animateTime = (current_time / 1000) % 2;
	while animateTime > 0
	{
		var maxLen = 16;
		draw_sprite_ext(sprite_index, 0, x + lengthdir_x(animateTime * maxLen, waveDir),
			y + lengthdir_y(animateTime * maxLen, waveDir), 1, 1, 0, c_white, (1 - animateTime) * 0.25);
		animateTime -= 0.4;
	}
}

event_inherited();