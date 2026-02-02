if room == rmStart
{
	room_goto(rmMain);
	send_signal(objPlayer, "spawn", true);
}