///@func solid_collisions()
solid_collisions = function()
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

///@func is_movement_key(key)
is_movement_key = function(key)
{
	var keys = struct_get_names(gameControl.directionKey);
	for (var i = 0; i < array_length(keys); i++)
	{ if gameControl.directionKey[$ keys[i]] == key { return true; } }
	
	return false;
}

///@func key_to_dir(key)
key_to_dir = function(key)
{
	var keys = struct_get_names(gameControl.directionKey);
	for (var i = 0; i < array_length(keys); i++)
	{ if gameControl.directionKey[$ keys[i]] == key { return keys[i]; } }
	
	return "";
}

///@func initial_dir(hsp, vsp)
initial_dir = function(hsp, vsp)
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

///@func update_direction()
update_direction = function()
{
	//establish first direction
	if !moving
	{
		firstDirection = initial_dir(hsp, vsp);
		
		if firstDirection != "" { moving = true; }
		else if state == playerStates.normal { firstDirection = stillDirection; }
	}
	
	//stopping movement
	if hsp == 0 && vsp == 0 { moving = false; }
	
	//set face direction
	if firstDirection != "" { faceDirection = firstDirection; }
	
	if !moving { exit; }
	
	if is_movement_key(keyboard_key) { stillDirection = key_to_dir(keyboard_key); }
	
	firstDirection = get_dir(hsp, vsp, axis);
	axis = get_axis(firstDirection, axis); //Update axis when direction axis changes
}

///@func knock(xChange, yChange, intensity, [dmg])
knock = function(xChange, yChange, intensity, dmg = 0)
{
	if state == playerStates.knockback { return; }
	
	objBarHealth.hp -= dmg;
	
	xstart = x;
	ystart = y;
	knockbackX = x + sign(xChange) * intensity;
	knockbackY = y + sign(yChange) * intensity;
	knockbackTime = 0;
}