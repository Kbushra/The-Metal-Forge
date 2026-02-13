///@desc Valid check

///@func is_valid(x, y)
is_valid = function(_x, _y)
{
	with (trigEnemySpawn)
	{
		if point_distance(x, y, _x, _y) <= 80 { return false; }
	}
	
	with (objBuildingMagnet)
	{
		if point_distance(x, y, _x, _y) <= 64 { return false; }
	}
	
	return place_free(_x, _y) && !place_meeting(_x, _y, [trigEnemySpawn, parentMetal]) &&
	!collision_rectangle_extended(_x, _y, _x, _y, trigDoor, sprite_width);
}