depth = -bbox_bottom;

with (parentMetal)
{
	if near_equals(x, other.x, 32) || near_equals(y, other.y, 32) { hp -= 0.7; shake = 5 - (5 * hp/maxHp); }
	else { shake = lerp(shake, 0, 0.1); }
}