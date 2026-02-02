if room == rmStart
{
	room_goto(rmMenu);
	send_signal(objPlayer, "spawn", true);
}