draw_set_colour(c_black);
draw_set_halign(fa_middle);

var softlocked = instance_number(parentBuilding) == 0 && global.resourceCount[resourceNames.metal] < 5;

if step <= 4
{
	with (trigEnemySpawn) { alarm[0] = 0; image_speed = 0; image_index = 0; } //No spawning
}
else if !done_action("reset_spawners")
{
	with (trigEnemySpawn) { alarm[0] = 60; image_speed = 1; } //Spawning
}

trigBreaker.active = step > 6;

switch step
{
	case 0:
	if alarm[0] <= 0 { alarm[0] = 120; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "Welcome to the tutorial.", 10, GAME_WIDTH - 20);
	break;
	
	case 1:
	if alarm[0] <= 0 { alarm[0] = 120; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "This is a guide on controls and game loop.", 10, GAME_WIDTH - 20);
	break;
	
	case 2:
	if objConstruction.open { step++; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "To start, press C to see your construction menu.", 10, GAME_WIDTH - 20);
	break;
	
	case 3:
	if !objConstruction.open { step++; }
	if ((global.constructLeft || global.constructRight) && alarm[0] <= 0) { alarm[0] = 120; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "You can change your selection with Q and E.", 10, GAME_WIDTH - 20);
	break;
	
	case 4:
	if instance_number(parentBuilding) >= 1 || softlocked { step++; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "Try placing something you can afford! You can only place it in the green.", 10, GAME_WIDTH - 20);
	break;
	
	case 5:
	if softlocked && alarm[0] <= 0 { alarm[0] = 240; }
	if instance_number(parentResource) >= 5 || global.resourceCount[resourceNames.metal] > 10 { step++; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "You have to avoid the enemies to keep HP up, and some enemies might damage the building. The building slowly loses stability too.", 10, GAME_WIDTH - 20);
	break;
	
	case 6:
	if softlocked || objProfit.profit > 2000 { step++; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "Resource is money. You can also build more with it.", 10, GAME_WIDTH - 20);
	break;
	
	case 7:
	if round_won() { step++; }
	draw_text_ext(GAME_WIDTH/2, GAME_HEIGHT - 35, "At any time, you can break the breaker and leave the room. You must reach a threshold to unlock the next level however.", 10, GAME_WIDTH - 20);
	break;
}

draw_reset();

if step == 8 || objBarHealth.hp <= 0 || objBarBuilding.hp <= 0 { instance_destroy(); }