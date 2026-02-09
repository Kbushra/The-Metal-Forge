audio_stop_sound(vibration);
play_sfx(sfxSmokeExplosion);

var ps = part_system_create(psSmoke);
part_particles_burst(ps, x, y, psSmoke);

for (var i = 0; i < array_length(global.enemy[ind].resourceTypes); i++)
{
	if random(1) <= global.enemy[ind].resourceProbabilities[i]
	{
		for (var j = 0; j < global.enemy[ind].resourceQuantities[i]; j++)
		{
			instance_create_depth(x, y, depth,
				global.resource[global.enemy[ind].resourceTypes[i]].obj);
		}
	}
}