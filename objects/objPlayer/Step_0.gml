depth = -bbox_bottom;

if got_signal("puppet")
{
	state = playerStates.puppet;
	stop_signal("puppet");
}
else { state = playerStates.normal; }

if state != playerStates.normal { exit; }

image_angle = 0;

spd = global.deny ? 2 : 1;

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

sprite_index = asset_get_index($"sprPlayer{correct_horizontal_dir(faceDirection)}{global.deny && moving ? "R" : ""}");