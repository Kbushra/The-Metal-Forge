///@func split()
split = function()
{
	var scale = 0.6;
	if image_xscale <= power(scale, 2) { return; }
	
	instance_create_depth(x, y, depth, objRadiowave,
	{
		image_xscale: image_xscale * scale,
		image_yscale: image_yscale * scale,
		image_angle: image_angle + 90,
		speed: speed * 1.15
	});
	
	instance_create_depth(x, y, depth, objRadiowave,
	{
		image_xscale: image_xscale * scale,
		image_yscale: image_yscale * scale,
		image_angle: image_angle - 90,
		speed: speed * 1.15
	});
}

direction = image_angle;

vibration = play_sfx(sfxVibrateHum, 1, speed, true);