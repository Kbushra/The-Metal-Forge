depth = -bbox_bottom;

with (parentMetal)
{
	if point_distance(x, y, other.x, other.y) <= 64 { hp--; shake = 5 - (5 * hp/maxHp); }
	else { shake = lerp(shake, 0, 0.1); }
}