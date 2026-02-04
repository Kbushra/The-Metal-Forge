if dir == HORIZONTAL
{
	draw_sprite_ext(sprDoor, 0, x + sprite_width * offset, y,
		image_xscale * 0.5, image_yscale, 0, c_white, 1);
	draw_sprite_ext(sprDoor, 0, x - sprite_width * offset, y,
		image_xscale * -0.5, image_yscale, 0, c_white, 1);
}

if dir == VERTICAL
{
	draw_sprite_ext(sprDoor, 0, x - sprite_xoffset, y + sprite_height/2 + sprite_height*offset,
		image_xscale, image_yscale * 0.5, 0, c_white, 1);
	draw_sprite_ext(sprDoor, 0, x - sprite_xoffset, y + sprite_height/2 - sprite_height*offset,
		image_xscale, image_yscale * -0.5, 0, c_white, 1);
}