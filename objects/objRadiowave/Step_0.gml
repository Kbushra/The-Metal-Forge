depth = -bbox_bottom;

if round_won()
{
	image_alpha -= 0.05;
	if image_alpha <= 0 { instance_destroy(); }
	exit;
}

mask_index = sprRadiowaveWallMask;
if place_free(x, y) { mask_index = -1; exit; }

objBarBuilding.deal_damage(speed / 20);
if random(1) < 0.7 { split(); }
instance_destroy();