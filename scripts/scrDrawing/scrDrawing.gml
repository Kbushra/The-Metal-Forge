function draw_reset()
{
	draw_set_colour(c_white);
	draw_set_alpha(1);
	
	draw_set_font(fntMain);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	if surface_get_target() != application_surface && surface_get_target() != NONE
	{ surface_reset_target(); }
	
	gpu_set_colorwriteenable(true, true, true, true);
	gpu_set_blendmode(bm_normal);
	shader_reset();
}

function draw_list(_x, _y, gapY, selected, item1)
{
	for (var i = 0; i < argument_count - 4; i++)
	{
		draw_text(_x, _y + gapY * i, (i == selected ? "> " : "") + argument[i + 4]);
	}
}