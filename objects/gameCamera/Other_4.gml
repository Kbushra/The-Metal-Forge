var camW = camera_get_view_width(view_camera[0]);
var camH = camera_get_view_height(view_camera[0]);
x = clamp(objPlayer.x - camW/2, 0, room_width - camW);
y = clamp(objPlayer.y - camH/2, 0, room_height - camH);
xstart = x;
ystart = y;