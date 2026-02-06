if room == rmMenu { open = false; }
else if global.construct { open = !open; }

if open { y = lerp(y, 0, 0.2); }
else { y = lerp(y, -sprite_height, 0.2); }

if !open { instance_destroy(parentPlacer); exit; }

if global.constructRight { selected++; }
if global.constructLeft { selected--; }
selected = clamp(selected, 0, array_length(availableBuildings) - 1);

var canAfford = true;
var reqResources = availableBuildings[selected].resourceTypes;
for (var i = 0; i < array_length(reqResources); i++)
{
	var obtained = global.resourceCount[reqResources[i]];
	var required = availableBuildings[selected].resourceQuantities[i];
	if obtained < required { canAfford = false; break; }
}

if canAfford && !instance_exists(availableBuildings[selected].placer)
{
	instance_destroy(parentPlacer);
	instance_create_depth(x, y, depth, availableBuildings[selected].placer);
}
else if !canAfford { instance_destroy(parentPlacer); }