if !got_signal("pathfound") || !log { exit; }

for (var i = 0; i < room_width/tileSize - 0.5; i++)
{
	for (var j = 0; j < room_height/tileSize - 0.5; j++)
	{
		if point_distance(sourceTileX, sourceTileY, i, j) > maxDistance { continue; }
		
		var node = nodes[i][j];
		
		if node.weight == NONE { draw_set_colour(c_black); draw_set_alpha(1); }
		else { draw_set_alpha(1 - (node.weight / maxWeight)); }
		
		draw_rectangle(node.x - tileSize/2, node.y - tileSize/2,
			node.x + tileSize/2, node.y + tileSize/2, false);
		
		draw_set_alpha(1);
		draw_set_colour(c_white);
	}
}