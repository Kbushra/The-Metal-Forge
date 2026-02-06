depth = -bbox_bottom;

x = objPlayer.x + get_spd_from_dir(objPlayer.faceDirection)[0] * 32;
y = objPlayer.y + get_spd_from_dir(objPlayer.faceDirection)[1] * 42;

sprite_index = object_get_sprite(building.obj);
image_blend = is_valid() ? c_green : c_red;

if global.confirm && is_valid()
{
	instance_create_depth(x, y, depth, building.obj);
	
	for (var i = 0; i < array_length(building.resourceTypes); i++)
	{
		global.resourceCount[building.resourceTypes[i]] -= building.resourceQuantities[i];
	}
}