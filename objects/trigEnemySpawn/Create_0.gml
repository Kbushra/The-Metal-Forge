assert(array_length(enemyTypes) == array_length(enemyProbabilities),
	"Enemy types doesn't match with probabilities!");

alarm[0] = RAND_ENEMYSPAWN * 1.5;
image_speed = 0;
spawnPs = part_system_create(psEnemy);