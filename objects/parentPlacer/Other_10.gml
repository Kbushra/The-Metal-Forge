///@desc Valid check

///@func is_valid()
is_valid = function()
{
	//Default, change in children
	return place_free(x, y) && !place_meeting(x, y, [trigEnemySpawn, parentMetal]);
}