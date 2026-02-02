function get_dir(_numX, _numY, priorityAxis) 
{
	var _num1 = priorityAxis == HORIZONTAL ? _numX : _numY;
	var _num2 = priorityAxis == HORIZONTAL ? _numY : _numX;
	
	if sign(_num1) == 1 { return priorityAxis == HORIZONTAL ? "R" : "D"; }
		else if sign(_num1) == -1 { return priorityAxis == HORIZONTAL ? "L" : "U"; }
	
	if sign(_num2) == 1 { return priorityAxis == HORIZONTAL ? "D" : "R"; }
		else if sign(_num2) == -1 { return priorityAxis == HORIZONTAL ? "U" : "L"; }
		
	return "D";
}

function correct_horizontal_dir(dir)
{
	if dir == "R" || dir == "L"
	{
		image_xscale = dir == "R" ? 1 : -1;
		return "R";
	}
	
	image_xscale = 1;
	return dir;
}

function get_axis_from_spd(hsp, vsp, _default = HORIZONTAL)
{
	if hsp == 0 && vsp == 0 { return _default; }
	if hsp != 0 && vsp == 0 { return HORIZONTAL; }
	if hsp == 0 && vsp != 0 { return VERTICAL; }
	return _default;
}

function get_axis(_dir, _default = HORIZONTAL)
{
	switch (_dir)
	{
		case "R": case "L": return HORIZONTAL;
		case "D": case "U": return VERTICAL;
		default: return _default;
	}
}