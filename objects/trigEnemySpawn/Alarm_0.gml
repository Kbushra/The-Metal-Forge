///@desc Spawn enemy
image_index = 0;
image_speed = 0;

play_sfx(sfxSmoke);

part_particles_burst(spawnPs, x, y, psSmoke);

spawn_enemy();

if random(1) >= swarmChance || instance_number(parentMetal) > swarmMax
{ alarm[0] = RAND_ENEMYSPAWN * delayMult / (hasReactor ? 2 : 1); exit; }

for (var i = 0; i < swarmCount; i++) { spawn_enemy(); }
alarm[0] = RAND_ENEMYSPAWN * delayMult * 3 / (hasReactor ? 2 : 1);