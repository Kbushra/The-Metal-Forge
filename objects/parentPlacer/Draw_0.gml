draw_self();

with (gamePathfinder)
{
	draw_set_alpha(0.2);
	draw_set_colour(c_green);
	
	for (var i = 0; i < room_width/tileSize - 0.5; i++)
	{
		for (var j = 0; j < room_height/tileSize - 0.5; j++)
		{
			if other.is_valid(tileSize/2 + i*tileSize, tileSize/2 + j*tileSize)
			{
				draw_rectangle(i*tileSize, j*tileSize, (i+1)*tileSize, (j+1)*tileSize, false);
			}
		}
	}
	
	draw_reset();
}