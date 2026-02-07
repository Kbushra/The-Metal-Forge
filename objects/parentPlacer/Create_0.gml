event_user(0);

with (gamePathfinder)
{
	var col = floor(other.x / tileSize);
	var row = floor(other.y / tileSize);
	var valid = other.is_valid(other.x, other.y) &&
		other.is_valid(tileSize/2 + col*tileSize, tileSize/2 + row*tileSize);
	
	image_blend = valid ? c_green : c_red;
}