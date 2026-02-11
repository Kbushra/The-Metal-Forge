function play_sfx(sfx, gain = 1, pitch = random_range(0.9, 1.1), loop = false)
{
	return audio_play_sound_on(global.sfxEmitter, sfx, loop, 10, gain, , pitch);
}

function play_bgm(bgm, gain = 1)
{
	if audio_sound_get_asset(global.bgm) == bgm
	{
		if audio_is_paused(global.bgm) { audio_resume_sound(global.bgm); }
		audio_sound_gain(global.bgm, gain);
		exit;
	}
	
	audio_stop_sound(global.bgm);
	global.bgm = audio_play_sound_on(global.bgmEmitter, bgm, true, 10, gain);
	return global.bgm;
}