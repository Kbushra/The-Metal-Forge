function array_push_unique(arr, element)
{
	if !array_contains(arr, element) { array_push(arr, element); }
}

function instance_create_unique(_x, _y, _depth, _obj, _vars = {})
{
	if !instance_exists(_obj) { instance_create_depth(_x, _y, _depth, _obj, _vars); }
}

function collision_rectangle_extended(x1, y1, x2, y2, obj, extension)
{
	return collision_rectangle(x1 - extension, y1 - extension, x2 + extension, y2 + extension,
		obj, false, true);
}