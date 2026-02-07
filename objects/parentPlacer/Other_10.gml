///@desc Valid check

///@func is_valid(x, y)
is_valid = function(_x, _y)
{
	//Default, change in children
	return place_free(_x, _y) && !place_meeting(_x, _y, [trigEnemySpawn, parentMetal]);
}