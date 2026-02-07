///@desc Enemy and resources

global.enemy[enemyNames.tin] =
{
	obj: objMetalTin,
	resourceTypes: [resourceNames.metal],
	resourceQuantities: [3],
	resourceProbabilities: [1]
}

global.enemy[enemyNames.conveyor] =
{
	obj: objMetalConveyor,
	resourceTypes: [resourceNames.metal, resourceNames.cog, resourceNames.battery],
	resourceQuantities: [3, 2, 1],
	resourceProbabilities: [1, 0.9, 0.4]
}

global.enemy[enemyNames.grill] =
{
	obj: objMetalGrill,
	resourceTypes: [resourceNames.metal, resourceNames.rod, resourceNames.quantum],
	resourceQuantities: [2, 3, 1],
	resourceProbabilities: [1, 0.7, 0.1]
}

global.resource[resourceNames.metal] =
{
	obj: objResourceMetal,
	icon: sprResourceMetal,
	sell: 105
}

global.resource[resourceNames.cog] =
{
	obj: objResourceCog,
	icon: sprResourceCog,
	sell: 124
}

global.resource[resourceNames.rod] =
{
	obj: objResourceRod,
	icon: sprResourceRod,
	sell: 132
}

global.resource[resourceNames.battery] =
{
	obj: objResourceBattery,
	icon: sprResourceBattery,
	sell: 231
}

global.resource[resourceNames.quantum] =
{
	obj: objResourceQuantum,
	icon: sprResourceQuantum,
	sell: 1006
}