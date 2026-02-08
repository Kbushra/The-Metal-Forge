function play_sfx(sfx, gain = 1, randomPitch = true)
{
	var snd = audio_play_sound_on(global.sfxEmitter, sfx, false, 10, gain);
	if randomPitch { audio_sound_pitch(snd, random_range(0.9, 1.1)); }
	return snd;
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