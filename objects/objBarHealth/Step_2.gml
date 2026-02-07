if (hp > 0 || (objBarBuilding.deathAnim && !deathAnim)) { exit; }
deathAnim = true;

with (objPlayer)
{
	send_signal(id, "puppet", true);
	sprite_index = sprPlayerElectrocuteDust;
	image_speed = 1;
	if image_index >= image_number - 1 { image_index = image_number - 1; }
}

if !done_action("set_alarm") { alarm[0] = 120; }