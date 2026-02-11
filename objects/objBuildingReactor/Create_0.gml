event_inherited();

spawner = noone;

with (trigEnemySpawn)
{
	if point_distance(x, y, other.x, other.y) <= 48 { other.spawner = id; hasReactor = true; }
}

assert(spawner != noone, "Reactor has no spawner!", false);