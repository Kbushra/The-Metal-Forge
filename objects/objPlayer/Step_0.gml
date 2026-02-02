depth = -bbox_bottom;

if got_signal("puppet")
{
	state = playerStates.puppet;
	stop_signal("puppet");
}
else { state = playerStates.normal; }

if got_signal("spawn") && assert(instance_number(trigSpawn) == 1, "Invalid spawn!")
{
	send_signal(gameCamera, "snap", true);
	x = trigSpawn.x;
	y = trigSpawn.y;
	
	stop_signal("spawn");
}

if state != playerStates.normal { exit; }

spd = global.run ? 2 : 1;

prevHsp = hsp;
prevVsp = vsp;

hsp = (global.right - global.left);
vsp = (global.down - global.up);

solid_collisions();

x += floor(hsp) * spd;
y += floor(vsp) * spd;

update_direction();

if image_speed != moving { image_index = moving; }
image_speed = moving;

sprite_index = asset_get_index($"sprPlayer{correct_horizontal_dir(faceDirection)}{global.run && moving ? "R" : ""}");