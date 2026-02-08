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
	gameCamera.shake = abs(spd)/2;
}

spd += 0.1;
spd = clamp(spd, -6, 6);

move_angle(image_angle, spd * image_xscale);

if spd >= 0 && !place_free(x, y)
{
	spd = clamp(-spd/2, -3, -0.5);
	objBarBuilding.deal_damage(abs(spd) / 4);
}