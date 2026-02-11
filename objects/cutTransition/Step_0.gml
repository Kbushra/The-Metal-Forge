depth = -9999;

if step == 0
{
	offset = exponential_in(GAME_HEIGHT/2, 0, time, 3);
	time += 0.05;
	
	if time >= 1 && !done_action("clank_in") { play_sfx(sfxClank); }
	
	if time >= 2
	{
		play_sfx(sfxClank); //Clank out
		
		//Spawn in early, its the same room
		if room == destRoom { objPlayer.spawn_in(); }
		objPlayer.knockbackTime = 1;
		
		step++;
		time = 0;
		room_goto(destRoom);
		
		for (var i = 0; i < resourceNames.length; i++) { global.resourceCount[i] = 0; }
		
		with (parentBar)
		{
			hp = maxHp;
			shownHp = maxHp;
			highlight = 1;
			deathAnim = false;
		}
	}
}

if step == 1
{
	offset = exponential_in(0, GAME_HEIGHT/2, time, 3);
	time += 0.05;
	
	if time >= 1.5 { instance_destroy(); }
}