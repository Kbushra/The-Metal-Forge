depth = -999;

image_angle += 20;

if !in_bounds_strict(x, y) && alarm[0] <= 0 { alarm[0] = 120; exit; }

if alarm[1] <= 0
{
	image_alpha -= 0.05;
	if image_alpha <= 0 { instance_destroy(); }
}

if electrocuteTimer > 0
{
	objPlayer.sprite_index = sprPlayerElectrocute;
	objPlayer.image_speed = 1;
	electrocuteTimer--;
	
	objBarHealth.deal_damage(dmg);
	
	image_xscale += 0.05;
	image_yscale += 0.05;
	image_alpha -= 0.05;
	gameCamera.shake = image_alpha > 0 && electrocuteTimer > 0;
	
	if electrocuteTimer <= 0 { instance_destroy(); }
	exit;
}

x += xSpd;

ySpd += 0.1;
y += ySpd;