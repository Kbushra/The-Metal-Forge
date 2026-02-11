depth = -bbox_bottom;
if state == pathfinderStates.puppet { exit; }

if spd >= 0 && !done_action("choose_dir")
{
	image_blend = c_white;
	image_angle = choose(0, 90);
	image_xscale = choose(1, -1);
}
else if spd < 0
{
	reset_action("choose_dir");
	image_blend = abs(spd) % 1 < 0.5 ? c_red : c_maroon;
	set_shake(abs(spd)/2, gameCamera);
}

spd += 0.1;
spd = clamp(spd, -6, 6);

var prevX = x;
var prevY = y;

move_angle(image_angle, spd * image_xscale);

if spd >= 0 && !place_free(x, y)
{
	x = prevX;
	y = prevY;
	
	spd = clamp(-spd/2, -3, -0.5);
	play_sfx(sfxThump, abs(spd) / 4);
	objBarBuilding.deal_damage(abs(spd) / 4);
}