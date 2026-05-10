var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

var padding = 10;
var clamp_x = clamp(x, cam_x + padding, cam_x + cam_w - padding);
var clamp_y = clamp(y, cam_y + padding, cam_y + cam_h - padding);

var distance_to_corner = point_distance(cam_x, cam_y, cam_x + cam_w/2, cam_y + cam_h/2);
var scale = clamp(sqrt( distance_to_corner / distance_to_object(objPlayer) ), 0.2, 1);

if x != clamp_x || y != clamp_y
{
	draw_sprite_ext(sprVoltWarning, 0, clamp_x - cam_x, clamp_y - cam_y,
		scale, scale, 0, c_white, image_alpha);
}