depth = -bbox_bottom;

if state == pathfinderStates.puppet
{
	if part_system_exists(radiationPs) part_system_destroy(radiationPs);
	instance_destroy(beam);
	exit;
}

if distance_to_object(objPlayer) < 16 { objBarHealth.deal_damage(0.1); }

part_system_position(radiationPs, x, y);
part_system_colour(radiationPs, c_white, 1);
part_system_depth(radiationPs, depth + 1);

if got_signal("beamed")
{
	hsp = -dcos(beam.image_angle);
	vsp = dsin(beam.image_angle);
	spd = 10;
	
	stop_signal("beamed");
}

if !place_free(x + hsp * spd, y + vsp * spd) { hsp = 0; vsp = 0; }

x += hsp * spd;
y += vsp * spd;
hsp = lerp(hsp, 0, 0.05);
vsp = lerp(vsp, 0, 0.05);