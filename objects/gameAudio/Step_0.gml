if !audio_is_playing(global.bgm) { exit; }
if !instance_exists(parentMetal) || round_won() { audio_sound_gain(global.bgm, 0.2); }
else { audio_sound_gain(global.bgm, 1); }