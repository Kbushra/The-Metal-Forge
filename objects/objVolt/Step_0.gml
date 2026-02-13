depth = -bbox_bottom;

image_angle += 20;

if ((place_meeting(x, y, objCarriage) && !place_free(x, y)) || round_won()) { instance_destroy(); exit; }
if !in_bounds_strict(x, y) && alarm[0] <= 0 { alarm[0] = 120; exit; }

if zapping
{
	objPlayer.sprite_index = sprPlayerElectrocute;
	objPlayer.image_speed = 1;
	
	objBarHealth.deal_damage(dmg);
	
	image_xscale += 0.05;
	image_yscale += 0.05;
	image_alpha -= 0.05;
	
	if !ignorePuppeting && objPlayer.state != playerStates.knockback { instance_destroy(); exit; }
	else if (ignorePuppeting && (objPlayer.state == playerStates.normal || image_alpha <= 0)) { instance_destroy(); exit; }
	
	set_shake(1, gameCamera);
	exit;
}

if alarm[1] <= 0
{
	image_alpha -= 0.05;
	if image_alpha <= 0 { instance_destroy(); }
}

x += xSpd;

ySpd += 0.1;
y += ySpd;