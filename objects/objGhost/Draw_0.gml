with (origin)
{
	var prevAlpha = image_alpha;
	var prevBlend = image_blend;
	
	image_alpha = 0.1;
	image_blend = c_black;
	draw_self();
	image_alpha = prevAlpha;
	image_blend = prevBlend;
}