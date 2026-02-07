if (hp > 0 || (objBarHealth.deathAnim && !deathAnim)) { exit; }
deathAnim = true;

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