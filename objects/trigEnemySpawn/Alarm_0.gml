///@desc Spawn enemy
image_index = 0;
image_speed = 0;

play_sfx(sfxSmoke);

part_particles_burst(spawnPs, x, y, psSmoke);

spawn_enemy();

var reactorEffect = 1 / (hasReactor ? 2 : 1);
var difficultyEffect = 1 / (raised_difficulty() ? 2 : 1);
var effects = reactorEffect * difficultyEffect;

if (instance_number(parentMetal) > swarmMax ||
(random(1) >= swarmChance && instance_number(parentMetal) > 1))
{ alarm[0] = RAND_ENEMYSPAWN * delayMult * effects; exit; }

for (var i = 0; i < swarmCount; i++) { spawn_enemy(); }
alarm[0] = RAND_ENEMYSPAWN * delayMult * 3 * effects;