depth = -bbox_bottom;

if got_signal("puppet") { state = playerStates.puppet;	}
else if knockbackTime < 1 { state = playerStates.knockback; }
else if state != playerStates.normal { state = playerStates.normal; image_index = 0; }

stop_signal("puppet");
stop_signal("knockback");

if !moving || global.deny || global.denyRelease { audio_stop_sound(sfxStep1); }

if moving && !audio_is_playing(sfxStep1)
{
	var snd = play_sfx(sfxStep1);
	if global.denyHeld { audio_sound_pitch(snd, audio_sound_get_pitch(snd) * 1.5); }
}

if state == playerStates.knockback
{
	var prevX = x;
	var prevY = y;
	x = exponential_out(xstart, knockbackX, knockbackTime, 2);
	y = exponential_out(ystart, knockbackY, knockbackTime, 2);
	if !place_free(x, y)
	{
		x = prevX;
		y = prevY;
		xstart = x;
		ystart = y;
		knockbackX = x;
		knockbackY = y;
	}
	
	image_speed = 0;
	image_index = 0;
	faceDirection = get_dir(knockbackX - xstart, knockbackY - ystart, axis);
	sprite_index = asset_get_index($"sprPlayer{correct_horizontal_dir(faceDirection)}");
	
	image_blend = knockbackTime % 0.2 < 0.1 ? c_red : c_maroon;
	
	knockbackTime += 0.05;
	if knockbackTime <= 0.3 { set_shake(1, gameCamera); }
}

if state != playerStates.normal { exit; }

image_blend = c_white;
image_angle = 0;
image_alpha = 1;

spd = global.denyHeld ? 2 : 1;

prevHsp = hsp;
prevVsp = vsp;

hsp = (global.right - global.left);
vsp = (global.down - global.up);

solid_collisions();

x += floor(hsp) * spd;
y += floor(vsp) * spd;

update_direction();

if image_speed != moving { image_index = !moving; }
image_speed = moving;

sprite_index = asset_get_index($"sprPlayer{correct_horizontal_dir(faceDirection)}{global.denyHeld && moving ? "R" : ""}");