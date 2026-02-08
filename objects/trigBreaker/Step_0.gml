depth = -999;

if !active { exit; }

if breaking
{
	send_signal(objPlayer, "puppet", true);
	
	if objPlayer.image_index >= 3
	{
		objBreakerPanel.image_index = 1;
		with (trigEnemySpawn) { alarm[0] = 0; } //No more spawning
		with (parentMetal) { state = pathfinderStates.puppet; image_speed = 0; image_index = 0; }
		with (trigDoor) { if destRoom != noone { solid = false; } }
	}
	
	if objPlayer.image_index >= 5 { breaking = false; }
}

if objPlayer.faceDirection != "U" || !place_meeting(x, y + 5, objPlayer) ||
breaking || objBreakerPanel.image_index == 1 || !global.confirm { exit; }

play_sfx(sfxPowerDown);
breaking = true;

with (objPlayer)
{
	send_signal(id, "puppet", true);
	sprite_index = sign(other.x - x) == -1 ? sprPlayerUPunchL : sprPlayerUPunchR;
	image_speed = 1;
}