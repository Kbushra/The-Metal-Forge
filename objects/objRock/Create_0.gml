y = -100;
shakeTimer = 30;

if killerRock
{
	image_index = 0;
	targY = objPlayer.bbox_bottom + 5;
	x = objPlayer.x;
	exit;
}

image_index = irandom(image_number);

var freeTiles = [];
with (gamePathfinder)
{
	for (var i = 0; i < room_width/tileSize - 0.5; i++)
	{
		for (var j = 0; j < room_height/tileSize - 0.5; j++)
		{
			with (other)
			{
				if place_free(other.tileSize/2 + i*other.tileSize, other.tileSize/2 + j*other.tileSize)
				{ array_push(freeTiles, [other.tileSize/2 + i*other.tileSize, other.tileSize/2 + j*other.tileSize]); }
			}
		}
	}
}

var ind = irandom(array_length(freeTiles) - 1);
x = freeTiles[ind][0];
targY = freeTiles[ind][1];