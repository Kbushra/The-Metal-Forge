if !instance_exists(origin) { instance_destroy(); exit; }

with (origin)
{
	if place_meeting(x, y, objRock) { exit; }
	
	var prevAlpha = image_alpha;
	var prevBlend = image_blend;
	
	var xShake = 0;
	var yShake = 0;
	if variable_instance_exists(id, "shake")
	{
		xShake = choose(-shake, shake);
		yShake = choose(-shake, shake);
	}
	
	image_alpha = 0.1;
	image_blend = c_black;
	x += xShake;
	y += yShake;
	
	draw_self();
	
	x -= xShake;
	y -= yShake;
	image_alpha = prevAlpha;
	image_blend = prevBlend;
}