for (var i = -sprite_height/2; i < sprite_height/2; i++)
{
	var curr_width = lineWidths[i+sprite_height/2];
	var curr_x = x;
	var curr_y = y;
	
	switch image_angle
	{
		case 0: case 180: curr_y = y+i; break;
		case 90: case 270: curr_x = x+i; break;
	}
	
	while curr_width > 0
	{
		draw_sprite_general(sprRadiationBeam, image_index, 0, i+sprite_height/2,
			clamp(curr_width, 0, sprite_width), 1, curr_x, curr_y, 1, 1, image_angle,
				c_white, c_white, c_white, c_white, image_alpha);
		
		curr_width -= sprite_width;
		
		switch image_angle
		{
			case 0: curr_x += sprite_width; break;
			case 90: curr_y -= sprite_width; break;
			case 180: curr_x -= sprite_width; break;
			case 270: curr_y += sprite_width; break;
		}
	}
}