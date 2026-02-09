///@desc Spawn enemy
image_index = 0;
image_speed = 0;

play_sfx(sfxSmoke);

part_particles_burst(spawnPs, x, y, psSmoke);

spawn_enemy();

if random(1) >= swarmChance || instance_number(parentMetal) > 2
{ alarm[0] = RAND_ENEMYSPAWN * delayMult; exit; }

for (var i = 0; i < 5; i++) { spawn_enemy(); }
alarm[0] = RAND_ENEMYSPAWN * delayMult * 3;