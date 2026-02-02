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