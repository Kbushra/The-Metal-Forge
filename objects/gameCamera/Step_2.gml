var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);
targetX = clamp(objPlayer.x + offset * objPlayer.hsp - camW/2, 0, room_width - camW);
targetY = clamp(objPlayer.y + offset * objPlayer.vsp - camH/2, 0, room_height - camH);

if objPlayer.prevHsp != objPlayer.hsp
{
	xstart = x;
	progressX = 0;
	print("a");
}

if objPlayer.prevVsp != objPlayer.vsp
{
	ystart = y;
	progressY = 0;
	print("b");
}

if targetX > x { x = floor(exponential_out(xstart, targetX, progressX, 3)); }
	else { x = ceil(exponential_out(xstart, targetX, progressX, 3)); }

if targetY > y { y = floor(exponential_out(ystart, targetY, progressY, 3)); }
	else { y = ceil(exponential_out(ystart, targetY, progressY, 3)); }

progressX += 0.02;
progressY += 0.02;

camera_set_view_pos(view_camera[0], x, y);