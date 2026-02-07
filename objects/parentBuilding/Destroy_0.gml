for (var i = 0; i < array_length(global.buildings[ind].resourceTypes); i++)
{
	var count = irandom_range(0, ceil(global.buildings[ind].resourceQuantities[i]/2));
	
	for (var j = 0; j < count; j++)
	{
		instance_create_depth(x, y, depth,
			global.resource[global.buildings[ind].resourceTypes[i]].obj);
	}
}