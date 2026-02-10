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

image_alpha = lerp(image_alpha, exponential_in(1, 0, time, 8), 0.2);
time += 0.005;

if time >= 1 { instance_destroy(); }