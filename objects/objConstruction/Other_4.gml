var availableResources = [];

with (trigEnemySpawn)
{
	for (var i = 0; i < array_length(enemyTypes); i++)
	{
		for (var j = 0; j < array_length(global.enemy[enemyTypes[i]].resourceTypes); j++)
		{
			array_push_unique(availableResources, global.enemy[enemyTypes[i]].resourceTypes[j]);
		}
	}
}

for (var i = 0; i < resourceNames.length; i++)
{
	if global.resourceCount[i] > 0
	{ array_push_unique(availableResources, i); }
}

availableBuildings = [];

for (var i = 0; i < array_length(global.buildings); i++)
{
	for (var j = 0; j < array_length(global.buildings[i].resourceTypes); j++)
	{
		if !array_contains(availableResources, global.buildings[i].resourceTypes[j]) { break; }
		
		if j == array_length(global.buildings[i].resourceTypes) - 1
		{ array_push_unique(availableBuildings, global.buildings[i]); }
	}
}