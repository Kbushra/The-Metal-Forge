depth = -bbox_bottom;
if state == pathfinderStates.puppet { exit; }

x = lerp(x, targX, 0.1);
y = lerp(y, targY, 0.1);

if attackIn
{
	image_yscale = lerp(image_yscale, 0.5, 0.2);
	
	if near_equals(image_yscale, 0.5, 0.05)
	{
		image_index = 0;
		image_speed = 0;
		attackOut = true;
		attackIn = false;
		volt = instance_create_depth(x, y - 10, 0, objVolt,
			{ xSpd: random_range(-5, 5), ySpd: random_range(-5, -2) });
	}
}

if attackOut
{
	image_yscale = lerp(image_yscale, 1, 0.2);
	
	if near_equals(image_yscale, 1, 0.05)
	{
		if morph
		{
			morphTimer--;
			
			if instance_exists(volt) && in_bounds_loose(volt.x, volt.y) &&
			place_free(volt.x, volt.y) && !tp && morphTimer <= 10
			{
				targX = volt.x;
				targY = volt.y + sprite_yoffset/2;
				tp = true;
			}
			
			if tp
			{
				with (volt)
				{
					xSpd = 0;
					ySpd = 0;
					image_xscale += 0.05;
					image_yscale += 0.05;
					image_alpha -= 0.05;
					if image_alpha <= 0 { instance_destroy(); }
				}
				
				image_alpha = lerp(image_alpha, 0, 0.2);
				if near_equals(image_alpha, 0, 0.05) && !instance_exists(volt)
				{ morph = false; tp = false; }
			}
			else if morphTimer <= 0 { morph = false; morphFail = true; }
			
			exit;
		}
		
		image_speed = 1;
		tp = false;
		attackOut = false;
		attackIn = false;
		attackDelay = 60;
	}
}

image_alpha = lerp(image_alpha, 1, 0.1);
if image_index >= image_number - 1 { image_index = image_number - 1; }

attackDelay--;
if attackDelay <= 0 && !attackIn && !attackOut
{
	attackIn = true;
	morph = morphFail || choose(false, true);
	morphFail = false;
	morphTimer = 60;
}