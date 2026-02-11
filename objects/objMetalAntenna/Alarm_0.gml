///@desc Send wave
instance_create_depth(x, y - sprite_width + 5, depth, objRadiowave,
	{ image_angle: irandom(3) * 90, speed: 2 });