///@desc Valid check

///@func is_valid(x, y)
is_valid = function(_x, _y)
{
	if !place_free(_x, _y) || place_meeting(_x, _y, [trigEnemySpawn, parentMetal]) { return false; }
	
	with (trigEnemySpawn)
	{
		if distance_to_point(_x, _y) <= 48 { return true; }
	}
	
	return false;
}