if round_won() { exit; }

var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

var padding = 10;
var clamp_x = clamp(x, cam_x + padding, cam_x + cam_w - padding);
var clamp_y = clamp(y, cam_y + padding, cam_y + cam_h - padding);

if x != clamp_x || y != clamp_y
{
	draw_sprite_ext(sprConveyorWarning, abs(spd) div 2.5, clamp_x - cam_x, clamp_y - cam_y,
		image_xscale, 1, image_angle, c_white, image_alpha);
}