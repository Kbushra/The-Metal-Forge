if (electrocuteTimer > 0 || (objPlayer.state == playerStates.puppet && !ignorePuppeting)) { exit; }

if other.state != playerStates.puppet { other.knock(1, 1, 5, dmg); }

play_sfx(sfxZap);
electrocuteTimer = timerLen;
if origin != noone { send_signal(origin, "electrocuted", true); }