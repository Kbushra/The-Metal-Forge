if electrocuteTimer > 0 { exit; }

electrocuteTimer = timerLen;
if origin != noone { send_signal(origin, "electrocuted", true); }