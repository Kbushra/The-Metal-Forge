startedRoom = true;

if room == rmStart || room == rmMenu { audio_stop_sound(global.bgm); exit; }
if !audio_is_playing(bgmMain) { play_bgm(bgmMain); }