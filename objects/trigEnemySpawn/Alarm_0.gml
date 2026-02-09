///@desc Spawn enemy
alarm[0] = RAND_ENEMYSPAWN;
image_index = 0;
image_speed = 0;

play_sfx(sfxSmoke);

part_particles_burst(spawnPs, x, y, psSmoke);

var chance = random(1);
var counter = 0;
for (var i = 0; i < array_length(enemyProbabilities); i++)
{
	counter += enemyProbabilities[i];
	if chance <= counter { instance_create_depth(x, y, depth, global.enemy[enemyTypes[i]].obj); exit; }
}

//If all chances failed (bro didnt make them add up to 1)
instance_create_depth(x, y, depth, global.enemy[enemyTypes[0]].obj);