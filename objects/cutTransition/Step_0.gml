depth = -9999;

if step == 0
{
	offset = exponential_in(GAME_HEIGHT/2, 0, time, 3);
	time += 0.05;
	
	if time >= 1 && !done_action("clank_in") { play_sfx(sfxClank); }
	
	if time >= 2
	{
		play_sfx(sfxClank); //Clank out
		
		step++;
		time = 0;
		room_goto(destRoom);
		
		objPlayer.spawn_in();
		
		for (var i = 0; i < resourceNames.length; i++) { global.resourceCount[i] = 0; }
		
		with (parentBar)
		{
			hp = maxHp;
			shownHp = maxHp;
			highlight = 1;
		}
	}
}

if step == 1
{
	offset = exponential_in(0, GAME_HEIGHT/2, time, 3);
	time += 0.05;
	
	if time >= 1.5 { instance_destroy(); }
}