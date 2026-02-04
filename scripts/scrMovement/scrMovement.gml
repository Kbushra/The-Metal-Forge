function move_until_collide(dx, dy, obj)
{
	var xColl = false;
	var yColl = false;
	var xInst = noone;
	var yInst = noone;
	
	for (var i = 0; i < max(abs(dx), abs(dy)); i++)
	{
		if !xColl && i < abs(dx) { xInst = instance_place(x + sign(dx), y, obj); }
		if !yColl && i < abs(dy) { yInst = instance_place(x, y + sign(dy), obj); }
		
		if xInst == noone && sign(dx) != 0 { x += xColl ? 0 : sign(dx); } else { xColl = true; }
		if yInst == noone && sign(dy) != 0 { y += yColl ? 0 : sign(dy); } else { yColl = true; }
		
		if xColl && yColl { return [xInst, yInst]; } //Collided fully
	}
	
	return [xInst, yInst];
}

//Returns if the x movement or y movement is still going
function move_towards_point_overworld(_x, _y, _speed, _prevMoving = [true, true])
{
	if !_prevMoving[0] { _x = x; }
	if !_prevMoving[1] { _y = y; }
	
	var signX = sign(_x - x);
	var signY = sign(_y - y);
	x += signX * _speed;
	y += signY * _speed;
	
	var newSignX = sign(_x - x);
	var newSignY = sign(_y - y);
	return [newSignX == signX && signX != 0, newSignY == signY && signY != 0];
}

function move_angle(_angle, _spd)
{
	x += dcos(_angle) * _spd;
	y -= dsin(_angle) * _spd;
}

function in_bounds(_x, _y)
{
	return _x > sprite_xoffset - sprite_width && _x < room_width + sprite_width - sprite_xoffset &&
		_y > sprite_yoffset - sprite_height && _y < room_height + sprite_height - sprite_yoffset;
}

function in_bounds_strict(_x, _y)
{ return _x > 0 && _x < room_width && _y > 0 && _y < room_height; }

function room_transition(rm)
{
	instance_create_depth(0, 0, 0, cutTransition, { destRoom: rm });
}