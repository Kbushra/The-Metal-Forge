if state == pathfinderStates.puppet { exit; }

other.knock(cos(image_angle + 45) * image_xscale, sin(image_angle + 45) * image_yscale,
	clamp(abs(spd) * 10, 20, 60), abs(spd) * 2);