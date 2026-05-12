if !attackOut && !round_won()
{
	var diff = angle_difference(point_direction(0, 0, targXSpd, targYSpd), arrowDir);
	var len = sqrt(sqr(targXSpd) + sqr(targYSpd)) / 5;
	
	if !done_action("start_dir") { arrowDir = abs(diff) <= 90 ? 0 : 180; }
	arrowDir += diff * 0.05;
	arrowLen = lerp(arrowLen, len, 0.05);
	
	draw_sprite_ext(sprVoltArrow, 0, x, y - sprite_height * 0.75, arrowLen, 1, arrowDir, c_white, 1);
}
else
{
	arrowDir = 0;
	arrowLen = 0;
	reset_action("start_dir");
}

if tp { draw_self(); exit; }
event_inherited();