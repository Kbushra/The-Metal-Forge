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

function is_movement_key(key)
{
	var keys = struct_get_names(gameControl.directionKey);
	for (var i = 0; i < array_length(keys); i++)
	{ if gameControl.directionKey[$ keys[i]] == key { return true; } }
	
	return false;
}

function key_to_dir(key)
{
	var keys = struct_get_names(gameControl.directionKey);
	for (var i = 0; i < array_length(keys); i++)
	{ if gameControl.directionKey[$ keys[i]] == key { return keys[i]; } }
	
	return "";
}

function initial_dir(hsp, vsp)
{
	if hsp == 0 && vsp == 0 { return ""; }
	
	if hsp != 0 && vsp == 0 { axis = HORIZONTAL; }
		else if hsp == 0 && vsp != 0 { axis = VERTICAL; }
			else { axis = choose(HORIZONTAL, VERTICAL); }
	
	if axis == HORIZONTAL
	{
		if hsp == 1 return "R";
		return "L";
	}
	
	if axis == VERTICAL
	{
		if vsp == 1 return "D";
		return "U";
	}
}

function update_direction()
{
	//establish first direction
	if !moving
	{
		firstDirection = initial_dir(hsp, vsp);
		
		if firstDirection != "" { moving = true; }
		else if is_movement_key(keyboard_key) && state == playerStates.normal
		{ firstDirection = key_to_dir(keyboard_key); }
	}
	
	//stopping movement
	if hsp == 0 && vsp == 0 { moving = false; }
	
	//set face direction
	if firstDirection != "" { faceDirection = firstDirection; }
	
	if !moving { exit; }
	
	firstDirection = get_dir(hsp, vsp, axis);
	axis = get_axis(firstDirection, axis); //Update axis when direction axis changes
}