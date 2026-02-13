#macro GAME_WIDTH 320
#macro GAME_HEIGHT 256

#macro HORIZONTAL 0
#macro VERTICAL 1
#macro NONE -1

#macro RAND_WANDER (irandom_range(120, 180))
#macro RAND_ENEMYSPAWN (irandom_range(360, 540))

#macro print show_debug_message

enum playerStates
{
	normal,
	knockback,
	puppet
}

enum carrierValue
{
	signal,
	package
}

enum carrierTarget
{
	instance,
	place
}

enum pathfinderStates
{
	puppet,
	wander,
	pathfind
}

enum enemyNames
{
	tin,
	conveyor,
	grill,
	radiator,
	antenna,
	
	length
}

enum buildingNames
{
	magnet,
	magnetCoiled,
	pedestal,
	ioniser,
	reactor,
	
	length
}

enum resourceNames
{
	metal,
	cog,
	rod,
	battery,
	quantum,
	alpha,
	
	length
}