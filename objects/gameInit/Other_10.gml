///@desc Metal resources

global.enemy[enemyNames.tin] =
{
	obj: objMetalTin,
	resourceTypes: [resourceNames.metal],
	resourceQuantities: [3],
	resourceProbabilities: [1]
}

global.enemy[enemyNames.conveyor] =
{
	obj: objMetalTin,
	resourceTypes: [resourceNames.metal, resourceNames.cog, resourceNames.battery],
	resourceQuantities: [3, 2, 1],
	resourceProbabilities: [1, 0.9, 0.4]
}

global.enemy[enemyNames.grill] =
{
	obj: objMetalTin,
	resourceTypes: [resourceNames.metal, resourceNames.rod, resourceNames.quantam],
	resourceQuantities: [2, 3, 1],
	resourceProbabilities: [1, 0.7, 0.1]
}