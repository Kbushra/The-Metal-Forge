function solid_collisions()
{
	if !place_free(x + hsp * spd, y)
	{
		while place_free(x + hsp, y) { x += hsp; }
        hsp = 0;
	}
    
	if !place_free(x, y + vsp * spd)
	{
		while place_free(x, y + vsp) { y += vsp; }
        vsp = 0;
	}
}