send_signal(objPlayer, "puppet", true);

if step == 0
{
	objPlayer.x += 2;
	objPlayer.sprite_index = sprPlayerRR;
	
	if objPlayer.x >= 100 && !instance_exists(objVolt)
	{ instance_create_depth(-32, 208, 0, objVolt, { origin: id }); }
	
	if got_signal("electrocuted") { step++; }
}

if step == 1
{
	objPlayer.image_angle -= 2;
	objPlayer.y += ySpd;
	ySpd += 0.1;
}