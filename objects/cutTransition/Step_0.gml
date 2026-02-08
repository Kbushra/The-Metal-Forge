depth = -9999;

if step == 0
{
	offset = exponential_in(GAME_HEIGHT/2, 0, time, 3);
	time += 0.05;
	
	if time >= 2
	{
		step++;
		time = 0;
		room_goto(destRoom);
		
		for (var i = 0; i < resourceNames.length; i++) { global.resourceCount[i] = 0; }
		objBarHealth.hp = 100;
		objBarBuilding.hp = 100;
	}
}

if step == 1
{
	offset = exponential_in(0, GAME_HEIGHT/2, time, 3);
	time += 0.05;
	
	if time >= 1.5 { instance_destroy(); }
}