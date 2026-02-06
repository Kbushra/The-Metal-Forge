depth = -bbox_bottom;

if got_signal("puppet") { state = playerStates.puppet;	}
else { state = playerStates.normal; }

if knockbackTime < 1 { state = playerStates.knockback; }

stop_signal("puppet");
stop_signal("knockback");

if state == playerStates.knockback
{
	var prevX = x;
	var prevY = y;
	x = exponential_out(xstart, knockbackX, knockbackTime, 2);
	y = exponential_out(ystart, knockbackY, knockbackTime, 2);
	if !place_free(x, y) { x = prevX; y = prevY; knockbackTime = 1; exit; }
	
	image_speed = 0;
	image_index = 0;
	faceDirection = get_dir(knockbackX - xstart, knockbackY - ystart, axis);
	stillDirection = faceDirection;
	sprite_index = asset_get_index($"sprPlayer{correct_horizontal_dir(faceDirection)}");
	
	image_blend = knockbackTime % 0.2 < 0.1 ? c_red : c_maroon;
	
	knockbackTime += 0.05;
	if knockbackTime <= 0.3 { gameCamera.shake = 1; }
}

if state != playerStates.normal { exit; }

image_blend = c_white;
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