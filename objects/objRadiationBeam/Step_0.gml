if round_won() { instance_destroy(); exit; }

x = origin.x;
y = origin.y;
depth = origin.depth + 1;

var has_damaged = false;
for (var i = ceil(-sprite_height/2); i < floor(sprite_height/2); i++)
{
	var ind = i+floor(sprite_height/2);
	var list = ds_list_create();
	
	switch image_angle
	{
		case 0:
			var count = collision_line_list(x, y+i, room_width, y+i, trigSolid, false, true, list, true);
			
			if position_meeting(x, y+i, trigSolid) { lineWidths[ind] = 0; }
			else if count == 0 { lineWidths[ind] = room_width - x; }
			else
			{
				var coll = list[| 0];
				lineWidths[ind] = coll.bbox_left > x ?
					coll.bbox_left - x : 0;
			}
			
		break;
		
		case 90:
			var count = collision_line_list(x+i, y, x+i, 0, trigSolid, false, true, list, true);
			
			if position_meeting(x+i, y, trigSolid) { lineWidths[ind] = 0; }
			else if count == 0 { lineWidths[ind] = y; }
			else
			{
				var coll = list[| 0];
				lineWidths[ind] = coll.bbox_bottom < y ?
					y - coll.bbox_bottom : 0;
			}
		break;
		
		case 180:
			var count = collision_line_list(x, y+i, 0, y+i, trigSolid, false, true, list, true);
			
			if position_meeting(x, y+i, trigSolid) { lineWidths[ind] = 0; }
			else if count == 0 { lineWidths[ind] = x; }
			else
			{
				var coll = list[| 0];
				lineWidths[ind] = coll.bbox_right < x ?
					x - coll.bbox_right : 0;
			}
			
		break;
		
		case 270:
			var count = collision_line_list(x+i, y, x+i, room_height, trigSolid, false, true, list, true);
			
			if position_meeting(x+i, y, trigSolid) { lineWidths[ind] = 0; }
			else if count == 0 { lineWidths[ind] = room_height - y; }
			else
			{
				var coll = list[| 0];
				lineWidths[ind] = coll.bbox_top > y ?
					coll.bbox_top - y : 0;
			}
		break;
	}
	
	ds_list_destroy(list);
	if has_damaged { continue; }
	
	switch image_angle
	{
		case 0:
			var rightPlayerColl = collision_line(x, y+i, x + lineWidths[ind], y+i, objPlayer, false, true);
			if instance_exists(rightPlayerColl) { deal_damage(); has_damaged = true; }
		break;
		
		case 90:
			var upPlayerColl = collision_line(x+i, y, x+i, y - lineWidths[ind], objPlayer, false, true);
			if instance_exists(upPlayerColl) { deal_damage(); has_damaged = true; }
		break;
		
		case 180:
			var leftPlayerColl = collision_line(x, y+i, x - lineWidths[ind], y+i, objPlayer, false, true);
			if instance_exists(leftPlayerColl) { deal_damage(); has_damaged = true; }
		break;
		
		case 270:
			var downPlayerColl = collision_line(x+i, y, x+i, y + lineWidths[ind], objPlayer, false, true);
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
		play_sfx(sfxGlint, 1, 0.5);
		beamed = true;
		time = 0;
		send_signal(origin, "beamed", true);
	}
	
	exit;
}

image_alpha = exponential_in(1, 0, time, 8);
time += 0.005;

if time >= 1 { instance_destroy(); }