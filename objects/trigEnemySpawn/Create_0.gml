assert(array_length(enemyTypes) == array_length(enemyProbabilities),
	"Enemy types doesn't match with probabilities!");

alarm[0] = 300;
image_speed = 0;
spawnPs = part_system_create(psSmoke);

hasReactor = false;

///@func spawn_enemy()
spawn_enemy = function()
{
	var chance = random(1);
	var counter = 0;
	for (var i = 0; i < array_length(enemyProbabilities); i++)
	{
		counter += enemyProbabilities[i];
		if chance <= counter
		{
			var inst = instance_create_depth(x, y, depth, global.enemy[enemyTypes[i]].obj);
			inst.hp = inst.maxHp / (hasReactor ? 3 : 1);
			exit;
		}
	}

	//If all chances failed (bro didnt make them add up to 1)
	var inst = instance_create_depth(x, y, depth, global.enemy[enemyTypes[0]].obj);
	inst.hp = inst.maxHp / (hasReactor ? 3 : 1);
}