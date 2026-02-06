///@desc Buildings

global.buildings[buildingNames.magnet] =
{
	icon: sprBuildingMagnet,
	obj: objBuildingMagnet,
	placer: objPlacerMagnet,
	resourceTypes: [resourceNames.metal],
	resourceQuantities: [5],
	desc: "Tears metal apart within 1 tile"
};

global.buildings[buildingNames.magnetCoiled] =
{
	icon: sprBuildingMagnetCoiled,
	obj: objBuildingMagnetCoiled,
	placer: objPlacerMagnetCoiled,
	resourceTypes: [resourceNames.metal, resourceNames.rod],
	resourceQuantities: [8, 4],
	desc: "Tears metal apart within 2 tiles"
};