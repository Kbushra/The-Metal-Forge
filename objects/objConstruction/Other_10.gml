///@desc Methods and buildings

///@func can_place()
can_place = function()
{
	var canAfford = true;
	var reqResources = availableBuildings[selected].resourceTypes;
	for (var i = 0; i < array_length(reqResources); i++)
	{
		var obtained = global.resourceCount[reqResources[i]];
		var required = availableBuildings[selected].resourceQuantities[i];
		if obtained < required { canAfford = false; break; }
	}

	var reachedLimit = instance_number(availableBuildings[selected].obj) >=
		availableBuildings[selected].count;
	
	return canAfford && !reachedLimit;
}

global.buildings[buildingNames.magnet] =
{
	icon: sprBuildingMagnet,
	obj: objBuildingMagnet,
	placer: objPlacerMagnet,
	resourceTypes: [resourceNames.metal],
	resourceQuantities: [5],
	desc: "Tears metal apart within 1 tile.",
	count: 2
};

global.buildings[buildingNames.magnetCoiled] =
{
	icon: sprBuildingMagnetCoiled,
	obj: objBuildingMagnetCoiled,
	placer: objPlacerMagnetCoiled,
	resourceTypes: [resourceNames.metal, resourceNames.rod],
	resourceQuantities: [8, 8],
	desc: "Tears metal apart at infinite distance on the NESW axis.",
	count: 1
};

global.buildings[buildingNames.pedestal] =
{
	icon: sprBuildingPedestal,
	obj: objBuildingPedestal,
	placer: objPlacerPedestal,
	resourceTypes: [resourceNames.metal],
	resourceQuantities: [10],
	desc: "Helps sustain stability.",
	count: 2
};

global.buildings[buildingNames.ioniser] =
{
	icon: sprBuildingIoniser,
	obj: objBuildingIoniser,
	placer: objPlacerIoniser,
	resourceTypes: [resourceNames.metal, resourceNames.rod, resourceNames.alpha],
	resourceQuantities: [6, 3, 10],
	desc: "Constantly shoots radiation at enemies.",
	count: 3
};

global.buildings[buildingNames.reactor] =
{
	icon: sprBuildingReactor,
	obj: objBuildingReactor,
	placer: objPlacerReactor,
	resourceTypes: [resourceNames.metal, resourceNames.alpha, resourceNames.quantum],
	resourceQuantities: [5, 6, 2],
	desc: "Increases spawn rate and spontaneously changes enemy hp.",
	count: 1
};