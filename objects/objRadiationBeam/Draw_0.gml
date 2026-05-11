for (var i = ceil(-sprite_height/2); i < floor(sprite_height/2); i++)
{
	var ind = i+floor(sprite_height/2);
	var curr_width = lineWidths[ind];
	var curr_x = x;
	var curr_y = y;
	
	switch image_angle
	{
		case 0: case 180: curr_y = y+i; break;
		case 90: case 270: curr_x = x+i; break;
	}
	
	while curr_width > 0
	{
		var segment_width = clamp(curr_width, 0, sprite_width);
		draw_sprite_general(sprRadiationBeam, image_index, 0, ind,
			segment_width, 1, curr_x, curr_y, 1, 1, image_angle,
				c_white, c_white, c_white, c_white, image_alpha);
		
		curr_width -= segment_width;
		
		switch image_angle
		{
			case 0: curr_x += segment_width; break;
			case 90: curr_y -= segment_width; break;
			case 180: curr_x -= segment_width; break;
			case 270: curr_y += segment_width; break;
		}
	}
}