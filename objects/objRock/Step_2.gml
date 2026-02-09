depth = -targY;

if y < targY { y += 8; exit; }

solid = true;

if !done_action("play_sfx") { play_sfx(killerRock ? sfxRockCrash2 : sfxRockCrash1); }

y = targY;
if shakeTimer > 0 { gameCamera.shake = 4; }
else if killerRock && !done_action("set_alarm") { alarm[0] = 60; }

shakeTimer--;