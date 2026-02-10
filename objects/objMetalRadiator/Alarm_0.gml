if state == pathfinderStates.puppet { alarm[0] = RAND_WANDER * 2; exit; }

beam = instance_create_depth(x, y, depth + 1, objRadiationBeam,
	{ origin: id, image_angle: choose(0, 90, 180, 270) });

var sfx = play_sfx(sfxGlint, 1, false);
audio_sound_pitch(sfx, 0.6);

alarm[0] = RAND_WANDER * 2;