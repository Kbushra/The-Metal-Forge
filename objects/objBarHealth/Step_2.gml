if (hp > 0 || (objBarBuilding.deathAnim && !deathAnim)) { exit; }
deathAnim = true;

with (objPlayer)
{
	send_signal(id, "puppet", true);
	sprite_index = sprPlayerElectrocuteDust;
	image_speed = 1;
	if image_index >= image_number - 1 { image_index = image_number - 1; }
}

if !done_action("set_alarm")
{
	var ps = part_system_create(psSmoke);
	part_particles_burst(ps, objPlayer.x, objPlayer.bbox_bottom, psSmoke);
	part_system_depth(ps, objPlayer.depth - 1);
	play_sfx(sfxSmoke);
	alarm[0] = 120;
}