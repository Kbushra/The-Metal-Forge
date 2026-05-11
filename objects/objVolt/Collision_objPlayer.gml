if (zapping || objPlayer.state == playerStates.knockback || (objPlayer.state == playerStates.puppet && !damagePuppets)) { exit; }

if other.state == playerStates.normal { other.knock(choose(-1, 1), choose(-1, 0, 1), 32, dmg); }

play_sfx(sfxZap);
if origin != noone { send_signal(origin, "electrocuted", true); }

zapping = true;