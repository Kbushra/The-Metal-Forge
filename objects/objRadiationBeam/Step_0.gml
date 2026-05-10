if round_won() { instance_destroy(); exit; }

x = origin.x;
y = origin.y;
depth = origin.depth + 1;

var has_damaged = false;
for (var i = -sprite_height/2; i < sprite_height/2; i++)
{
	var leftColl = collision_line(x, y+i, 0, y+i, trigSolid, false, true);
	var rightColl = collision_line(x, y+i, room_width, y+i, trigSolid, false, true);
	var upColl = collision_line(x+i, y, x+i, 0, trigSolid, false, true);
	var downColl = collision_line(x+i, y, x+i, room_height, trigSolid, false, true);
	
	switch image_angle
	{
		case 0:
			if instance_exists(rightColl) { lineWidths[i+sprite_height/2] = rightColl.bbox_left - x; }
			else { lineWidths[i+sprite_height/2] = room_width - x; }
		break;
		
		case 90:
			if instance_exists(upColl) { lineWidths[i+sprite_height/2] = y - upColl.bbox_bottom; }
			else { lineWidths[i+sprite_height/2] = y; }
		break;
		
		case 180:
			if instance_exists(leftColl) { lineWidths[i+sprite_height/2] = x - leftColl.bbox_right; }
			else { lineWidths[i+sprite_height/2] = x; }
		break;
		
		case 270:
			if instance_exists(downColl) { lineWidths[i+sprite_height/2] = downColl.bbox_top - y; }
			else { lineWidths[i+sprite_height/2] = room_height - y; }
		break;
	}
	
	if has_damaged { continue; }
	
	var leftPlayerColl = collision_line(x, y+i, x - lineWidths[i+sprite_height/2], y+i, objPlayer, false, true);
	var rightPlayerColl = collision_line(x, y+i, x + lineWidths[i+sprite_height/2], y+i, objPlayer, false, true);
	var upPlayerColl = collision_line(x+i, y, x+i, y - lineWidths[i+sprite_height/2], objPlayer, false, true);
	var downPlayerColl = collision_line(x+i, y, x+i, y + lineWidths[i+sprite_height/2], objPlayer, false, true);
	
	switch image_angle
	{
		case 0:
			if instance_exists(rightPlayerColl) { deal_damage(); has_damaged = true; }
		break;
		
		case 90:
			if instance_exists(upPlayerColl) { deal_damage(); has_damaged = true; }
		break;
		
		case 180:
			if instance_exists(leftPlayerColl) { deal_damage(); has_damaged = true; }
		break;
		
		case 270:
			if instance_exists(downPlayerColl) { deal_damage(); has_damaged = true; }
		break;
	}
}

if !beamed
{
	image_alpha = lerp(0, 0.2, time);
	time += 0.02;
	
	if time >= 1
	{
		play_sfx(sfxGlint);
		beamed = true;
		time = 0;
		send_signal(origin, "beamed", true);
	}
	
	exit;
}

image_alpha = exponential_in(1, 0, time, 8);
time += 0.005;

if time >= 1 { instance_destroy(); }