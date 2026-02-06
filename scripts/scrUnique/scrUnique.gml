function array_push_unique(arr, element)
{
	if !array_contains(arr, element) { array_push(arr, element); }
}

function instance_create_unique(_x, _y, _depth, _obj, _vars = {})
{
	if !instance_exists(_obj) { instance_create_depth(_x, _y, _depth, _obj, _vars); }
}