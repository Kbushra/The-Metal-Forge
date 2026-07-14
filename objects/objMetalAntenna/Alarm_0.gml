///@desc Send wave
if round_won() || instance_number(objRadiowave) >= 5 { exit; }

instance_create_depth(x, y - sprite_width + 5, depth, objRadiowave,
	{ image_angle: waveDir, speed: 2 });

waveDir = irandom(3) * 90;