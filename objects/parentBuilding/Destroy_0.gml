var total = 0;

for (var i = 0; i < array_length(global.buildings[ind].resourceTypes); i++)
{
	var count = irandom_range(0, ceil(global.buildings[ind].resourceQuantities[i]/2));
	total += count;
	
	for (var j = 0; j < count; j++)
	{
		instance_create_depth(x, y, depth,
			global.resource[global.buildings[ind].resourceTypes[i]].obj);
	}
}

if total == 0
{
	var randResource = irandom(array_length(global.buildings[ind].resourceTypes) - 1);
	
	instance_create_depth(x, y, depth,
		global.resource[global.buildings[ind].resourceTypes[randResource]].obj);
}