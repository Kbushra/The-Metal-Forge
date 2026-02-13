///@desc Valid check

///@func is_valid(x, y)
is_valid = function(_x, _y)
{
	//Default
	return place_free(_x, _y) && !place_meeting(_x, _y, [trigEnemySpawn, parentMetal]) &&
	!collision_rectangle_extended(_x, _y, _x, _y, trigDoor, sprite_width);
}