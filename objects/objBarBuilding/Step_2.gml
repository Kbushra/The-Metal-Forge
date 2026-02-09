if instance_number(parentMetal) > 0 && objPlayer.state == playerStates.normal &&
!round_won() { hp -= 0.005 * power(0.7, instance_number(objBuildingPedestal)); }

if (hp > 0 || (objBarHealth.deathAnim && !deathAnim)) { exit; }
deathAnim = true;

if !done_action("play_sfx") { play_sfx(sfxRumbleShort); }

with (objPlayer)
{
	send_signal(id, "puppet", true);
	freeze();
}

collapseTimer--;
if collapseTimer <= 0 && instance_number(objRock) < 3
{
	instance_create_depth(0, 0, 0, objRock, { killerRock: instance_number(objRock) == 2 });
	collapseTimer = 30;
}

gameCamera.shake = 1;